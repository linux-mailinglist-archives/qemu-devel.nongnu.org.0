Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 621DC5815E2
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jul 2022 17:03:15 +0200 (CEST)
Received: from localhost ([::1]:46386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGM5Z-0003Rp-UE
	for lists+qemu-devel@lfdr.de; Tue, 26 Jul 2022 11:03:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oGM1f-0007Os-Da
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 10:59:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38882)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oGM1c-0001jX-KJ
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 10:59:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658847547;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=70oJqdnEfQeJ4nk4sUORQ5L6L+G/tYoPpM5+AZIiIeA=;
 b=LU7MwnG/pcQ/wHMS6MTFt1FJtm8JyFu9sHXW3PSpzkgY8Zu4ooDpxFi3lDXivQqP2bdAF0
 y2tXsw4ySlatRQigXZWm0r6flRwh6R3Xe8lAdmZ53My1iY++J2f5wCk4z9eeAW1NWp2MHq
 OCRsy2YDj+RDlerbWCRYPw+FHyvhj+A=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-582-_kCxj3gpNp-csv3BNm8fcw-1; Tue, 26 Jul 2022 10:59:06 -0400
X-MC-Unique: _kCxj3gpNp-csv3BNm8fcw-1
Received: by mail-ed1-f69.google.com with SMTP id
 w15-20020a056402268f00b0043be4012ea9so4758401edd.4
 for <qemu-devel@nongnu.org>; Tue, 26 Jul 2022 07:59:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=70oJqdnEfQeJ4nk4sUORQ5L6L+G/tYoPpM5+AZIiIeA=;
 b=EXxN1gbE/xjuEsNBEPBbgAuMds33OutHQtVlIdn+Bft+Uu3zx/KB515kChFeyelups
 anwR5eRVuGwuWcd7V2/7jd0MadJqiNq4V605oaw2aJwrNtWIWBYOIkfmOr3NC645jHmK
 lgBf9vODRHjaPa9L3eT+bJIJZyh5AO8WlGceJdmIlrhjLq83D7+SS5EpP0Ici6whgdyw
 jXXAJ+0I8yGW8dNMJBZ6auSfg1jMG5kdRPUp9Jc2l5VIh7DGjiszOqHuiQaVWsSJ2cpt
 in/3Hfm3wKEOsYqDtxIwAAWdhMx96D5UNXuqK58NkD1YDLyN7hen7IxtkODnD+HB7efp
 PD6A==
X-Gm-Message-State: AJIora9G0vU4KQ0XHLjra/GS2Q5A4W+2ijsa5s3JrauByKyPVR7hl9zj
 Ek8xHHsSYlU7cBtRalursmHqT0qo5ugVWoEMFJR2kuD4/qFeRUqyRxcLO6ePimR/DrBr/MLfqTH
 7eZ/GnU8LIZ8Ap7g=
X-Received: by 2002:a05:6402:2786:b0:43a:dc4e:ea63 with SMTP id
 b6-20020a056402278600b0043adc4eea63mr19280432ede.175.1658847545643; 
 Tue, 26 Jul 2022 07:59:05 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vu6m+zqMqu21y6FkvkYAdeDsZM9q2eEQgbbasK2siS0lm6UgS0EFTepXFqPJBjfj1sQ3p5zQ==
X-Received: by 2002:a05:6402:2786:b0:43a:dc4e:ea63 with SMTP id
 b6-20020a056402278600b0043adc4eea63mr19280391ede.175.1658847545085; 
 Tue, 26 Jul 2022 07:59:05 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89?
 ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.googlemail.com with ESMTPSA id
 h23-20020aa7c957000000b0043bea0a48d0sm4113413edt.22.2022.07.26.07.59.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Jul 2022 07:59:04 -0700 (PDT)
Message-ID: <7242f915-03a7-2e22-26a4-3d3a11fbcac6@redhat.com>
Date: Tue, 26 Jul 2022 16:59:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: QEMU Developer Survey for KVM Forum 2022
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
References: <87v8rkgfgl.fsf@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <87v8rkgfgl.fsf@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/26/22 15:27, Alex Bennée wrote:
> Hi,
> 
> For the QEMU keynote at KVM Forum I'd like to repeat the developer
> survey this year. It's only short (7 questions) and reprises some of the
> questions from last year as well as a couple of new ones. It should only
> take a few minutes to complete.
> 
> You can find the survey at:
> 
>    https://forms.gle/Y1niFJLbBHmA5Pgk9
> 
> I'll be presenting the data along with all the other interesting stats
> in our QEMU keynote session at this years KVM Forum (Sep 12th-14th).
> 
> Thanks in advance for your time.

Can you add "get paid to work partly on QEMU" and possibly add 
percentages (e.g. <30%, 30-70%, >70%)?

Paolo


