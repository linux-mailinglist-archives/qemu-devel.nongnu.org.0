Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2455A6D8FDC
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Apr 2023 08:57:28 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pkJYV-0002TE-Px; Thu, 06 Apr 2023 02:57:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pkJYT-0002Sp-GW
 for qemu-devel@nongnu.org; Thu, 06 Apr 2023 02:57:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pkJYR-00031w-QI
 for qemu-devel@nongnu.org; Thu, 06 Apr 2023 02:57:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680764226;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KbsCPlwedXnE5sOkaQROhVY5ujP+edrp6NlFdJrwLhY=;
 b=UMnA2vvz+xzimEyN8HNj5Z5IXUEdOGOxENwPFF1bxtNUHCoke7xE8eN4i4hVC/50dUACUo
 61ZhL77POrOlR/N5a0wSK52EHT4ng8Ibj3XVbV88EFpDTLUnZG9qTGcrgh/K4t2FEyitMh
 9JUdN/2MCV/FBRERq5+HGE713DU5iv4=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-287-jU5BoGedMrC0u6aQQ6iVQQ-1; Thu, 06 Apr 2023 02:57:04 -0400
X-MC-Unique: jU5BoGedMrC0u6aQQ6iVQQ-1
Received: by mail-qv1-f70.google.com with SMTP id
 m3-20020a0cbf03000000b005de7233ca79so15214816qvi.3
 for <qemu-devel@nongnu.org>; Wed, 05 Apr 2023 23:57:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680764224;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KbsCPlwedXnE5sOkaQROhVY5ujP+edrp6NlFdJrwLhY=;
 b=gjLOpS2XuIc0TdoviWxa2e/4XbH7IUj0qu2Zlmki6MXZSDOFvvixvngoK2htvpum/n
 KP4Whg9ORrFVcFocJLiCwQyB2zBYxvOwGdkmj1JSGbrPxT3Gno6ktoM7RPNOOwOfHfUv
 ilaQHUcWRuVgZQtncHpl9RnquzZ+sg328Wl+I705+QAFXl8WXFo8Mwjs92woPgrnlrt0
 2ebFUcOUIBA2Aaf5wHwJ89/UZYsldTMGSfpWG6GPRJVIc6pZvZspq9YIBNg06peYF9uT
 y1pYH+XA9Uk9mmcHaKbLxGQzGrHxKvrC6sdnCoAcodItzls/HnPUGeN3RXeUOrMsl0w7
 CFNg==
X-Gm-Message-State: AAQBX9fSDgfc1F0upl/aCGDW0WyJCG5NwMQ6rmA+JZ7HC64EFyPWowGl
 1etmMXop8HDT1St96jYdv/af+ja7oIvvmSD3raFTZlaslkgUW/Ss4NnmzBB7GDImk9lwMiD2KY0
 KtZTdkqQOak7iZYU=
X-Received: by 2002:a05:6214:e6c:b0:5b2:fb2:4b1d with SMTP id
 jz12-20020a0562140e6c00b005b20fb24b1dmr2991734qvb.12.1680764224351; 
 Wed, 05 Apr 2023 23:57:04 -0700 (PDT)
X-Google-Smtp-Source: AKy350bxVOU6GM4pnXdrFORG6jMoQ4jm7BTcN/bTxjRxBeyBmttHmRClqv0Zbar80AwT+51TD1YY/A==
X-Received: by 2002:a05:6214:e6c:b0:5b2:fb2:4b1d with SMTP id
 jz12-20020a0562140e6c00b005b20fb24b1dmr2991722qvb.12.1680764223965; 
 Wed, 05 Apr 2023 23:57:03 -0700 (PDT)
Received: from [192.168.0.3] (ip-109-43-178-193.web.vodafone.de.
 [109.43.178.193]) by smtp.gmail.com with ESMTPSA id
 ef2-20020a0562140a6200b005dd8b93457bsm318425qvb.19.2023.04.05.23.57.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Apr 2023 23:57:03 -0700 (PDT)
Message-ID: <4521ce29-1d11-f253-7a7d-342f6bd9e6b0@redhat.com>
Date: Thu, 6 Apr 2023 08:57:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: s390 private runner CI job timing out
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <CAFEAcA_7+5tK+rM6dBgozNJmMmL7fU3MHLuvzJtb7-zWK4rMTQ@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <CAFEAcA_7+5tK+rM6dBgozNJmMmL7fU3MHLuvzJtb7-zWK4rMTQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.355, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 05/04/2023 17.15, Peter Maydell wrote:
> The s390 private runner CI job ubuntu-20.04-s390x-all seems to have
> started timing out a lot recently. Here's an example where it passed,
> but with only 53 seconds left on the clock before it would have been
> killed:
> 
> https://gitlab.com/qemu-project/qemu/-/jobs/4066136770
> 
> It looks like 'make check' was about 30 minutes of the 75 minutes
> total, and compilation was 45 minutes.
> 
> Any suggestions for how we can trim this down? (Presumably we
> could also raise the time limit given that this is a private
> runner job...)

I don't have access to that system, so I can only guess: Did you check 
whether there are any other processes still running (leftovers from earlier 
test runs)? If not, it's maybe because it is a VM that is running with other 
VMs in parallel that hog the CPU? In that case, you could contact the owner 
of the machine and ask whether there  is anything that could be done about 
it. Or simply increase the timeout a little bit more... (our highest timeout 
in another job is 90 minutes, so I think that would still be OK?).

  Thomas


