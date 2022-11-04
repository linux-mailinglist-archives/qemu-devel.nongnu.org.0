Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81739619118
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Nov 2022 07:29:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqqBF-0004WJ-Bj; Fri, 04 Nov 2022 02:27:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oqqAw-0004Vi-3t
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 02:27:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oqqAu-0003fo-HA
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 02:27:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667543251;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6gq+TDykKifyjASusyQjgEh09DDwI9MHp2M4YH8X7q8=;
 b=e5cUFCDb9YpdEMMzGHwtoXKp14Ca3MgA6kY3xY/pfJ20r0+CW/jSfkEgslE+nYtOIX2UI/
 FQvs6i3q19yJoLbdTxl0VU0rppKO6gNg22avyoeONxwD/HznjqSbKZZcX1qBYNr94HiSA3
 CwFzNRQJxvHu4xMogrgl/8A6ESCDGlk=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-596-6BgGE1KRPDeh8sNuvoPxdA-1; Fri, 04 Nov 2022 02:27:29 -0400
X-MC-Unique: 6BgGE1KRPDeh8sNuvoPxdA-1
Received: by mail-wr1-f69.google.com with SMTP id
 u13-20020adfa18d000000b00236566b5b40so921536wru.9
 for <qemu-devel@nongnu.org>; Thu, 03 Nov 2022 23:27:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6gq+TDykKifyjASusyQjgEh09DDwI9MHp2M4YH8X7q8=;
 b=SFDQ5JcYH8qZZftGcnoSAZAWqeUZC4eKrDwgTmVV6C5tO1oOZ7UhyrbmWrH4bjz6wy
 nEqyZYpUdqD7gmdrE6OWEOOJcnEICbMBx10q8PHu35BWJ5vlT6T5/neQyhM0UjcORmfk
 URG2idLOjtrxp2KgXijnIXJxeX9/YLPYoTeekaCSMruulJ7OOKvYtOLjyLi9Dhu/ROen
 KBvLaxbSlCOsyahinE177sFmY+3QuKNiH1k5NT1L8bw23xm0Cl73pZbOIzJLtoCzqARy
 TtYZ9NRAoTvtQ3Hp/YiQbxnolPOvVSUIdnrTW2XbCMyT73XhawrcWEeVa/fc4oxTulfc
 AEMg==
X-Gm-Message-State: ACrzQf2XGvAez+UWc2X+eMQQZbpBTd5tV5azwcy6vb6SQ1S+P3z9XEOt
 TiGVvyOITBE37aeoxLrHjOtD7ziGwN4IAyFAk8XRkLT978lQo+J3uVf+aptQgyAohMlMjdXzsMp
 2n8CdroA1ksrPfnY=
X-Received: by 2002:a5d:4d12:0:b0:236:751a:9c90 with SMTP id
 z18-20020a5d4d12000000b00236751a9c90mr21091157wrt.609.1667543248409; 
 Thu, 03 Nov 2022 23:27:28 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4pS5rZVyf48O/ZLSHWpaidGtSRaf7SziigWJocjVS7aW06/zOJxLVuQB3Fgkw3HQ9T8/uqqQ==
X-Received: by 2002:a5d:4d12:0:b0:236:751a:9c90 with SMTP id
 z18-20020a5d4d12000000b00236751a9c90mr21091142wrt.609.1667543248177; 
 Thu, 03 Nov 2022 23:27:28 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-177-201.web.vodafone.de.
 [109.43.177.201]) by smtp.gmail.com with ESMTPSA id
 y3-20020a056000108300b002366f300e57sm2576068wrw.23.2022.11.03.23.27.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Nov 2022 23:27:27 -0700 (PDT)
Message-ID: <599dd8d8-33d0-1bd7-dfe3-01bb2712f2bc@redhat.com>
Date: Fri, 4 Nov 2022 07:27:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH] gitlab-ci: split clang-user to avoid timeout
Content-Language: en-US
To: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
Cc: Beraldo Leal <bleal@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
References: <20221103212321.387738-1-stefanha@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20221103212321.387738-1-stefanha@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.047,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 03/11/2022 22.23, Stefan Hajnoczi wrote:
> GitLab CI times out when the clang-user job takes over 1 hour.

Oh, that's new to me ... is that a regression? Has something become slower? 
Or did we just add more stuff to the user builds recently?

Anyway, if it's just taking a little bit longer than 1h, it's likely better 
to bump the timeout by 10 minutes (to 70 minutes), I guess that will still 
take less CI minutes to run than to have two jobs.

  Thomas


