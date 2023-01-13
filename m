Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F17D6692EE
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Jan 2023 10:29:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGGLH-00009R-CW; Fri, 13 Jan 2023 04:27:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pGGLE-00008z-Pz
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 04:27:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pGGLC-0004tl-S5
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 04:27:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673602034;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=J3gUJmQAhlQ1U4sUUKpO210Cnl04uqDCCn0c5sYAZ4k=;
 b=eTmhwTpHNN8K2culPPqHYDtOw4WX0fzB+KK10dAAA7zMvkyeEO3daJWMgSbcOrBLKnRmf7
 HJE5vsylggIXTBzCMTO1J1jPqaGdH3oIXysYq2VnYc/Ppv8uPkousbNAoNVZKDDOUGoc0M
 ctc3C/PvvT68L6BAuQTuTkPqfx05AVo=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-377-stjNplb5NuuYtioChB9xKw-1; Fri, 13 Jan 2023 04:27:12 -0500
X-MC-Unique: stjNplb5NuuYtioChB9xKw-1
Received: by mail-wm1-f69.google.com with SMTP id
 n9-20020a05600c3b8900b003d9f14e904eso7957086wms.9
 for <qemu-devel@nongnu.org>; Fri, 13 Jan 2023 01:27:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:subject:from:cc:references:to
 :content-language:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=J3gUJmQAhlQ1U4sUUKpO210Cnl04uqDCCn0c5sYAZ4k=;
 b=5u4fvLcvifmhsKlTJxInNtugAbwsG/AdoH2Dkgggro9RiwgKVq+8pGOV9ZYwwQ4DdR
 RQGbKBRJkcNbbF90NX/DXtLtBswv+JFOpxL7R3WXlaE13k6XnmpRFyGaej8wfYWPaxAy
 BWg2zfIh1xlYMCpw5pyOug1AszeQYcUzEKJtwm4rS27wFkwu8Z7pjTcZQpegY4XMHTjX
 I/ah/WxaAdCphu5pyVDNyzoF3jJdmYss47S6YzZWKLDO/ZbkKX+DNh72hqm+EV1T9VoN
 LQLzEEzWUaZWdnb1b9B4hRIRW56/qRq7nX1cobVEJnrHG4GoWtZ/OTK2pxdgus8rRBI2
 FDHA==
X-Gm-Message-State: AFqh2kpWeR577zLGt9nQn2uuohoAlbobQqIVB6yF/muqFduvbDRte19y
 urGuhhwIbpl6qNyNIe6HFfBNpMa21P+h6oDdhxFVGuzrskkMN8LUzFOoewX4m5iE7coKvaRgduX
 5dK2GzbW8ITbPk7g=
X-Received: by 2002:a5d:4d8d:0:b0:2bd:ca88:d07a with SMTP id
 b13-20020a5d4d8d000000b002bdca88d07amr4466995wru.33.1673602031867; 
 Fri, 13 Jan 2023 01:27:11 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvpmUkiahQ0XXcVIp7jzNgt2w5ReD+hDCQ4bHQCsElfKjPto6Knppjlcf/9SGdXK/j9JMcIOw==
X-Received: by 2002:a5d:4d8d:0:b0:2bd:ca88:d07a with SMTP id
 b13-20020a5d4d8d000000b002bdca88d07amr4466974wru.33.1673602031496; 
 Fri, 13 Jan 2023 01:27:11 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-177-39.web.vodafone.de.
 [109.43.177.39]) by smtp.gmail.com with ESMTPSA id
 n13-20020a5d67cd000000b002bdcce37d31sm5247029wrw.99.2023.01.13.01.27.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Jan 2023 01:27:10 -0800 (PST)
Message-ID: <f1c34dd3-7e90-ff40-a1e0-b35f031b3a15@redhat.com>
Date: Fri, 13 Jan 2023 10:27:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: Rot127 <unisono@quyllur.org>, qemu-devel@nongnu.org
References: <c4ec12d4-e07c-ada9-5cec-744dae7c069b@quyllur.org>
Cc: qemu-arm <qemu-arm@nongnu.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 capstone-users@lists.sourceforge.net
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [Capstone] Feedback request for new architecture updater
In-Reply-To: <c4ec12d4-e07c-ada9-5cec-744dae7c069b@quyllur.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 12/01/2023 17.24, Rot127 wrote:
> I currently work on a new updater for architecture modules in Capstone.
> 
> The current update process has the problem that it is a lot of manual work.
> Syncing the information from LLVM to Capstone requires a one to translate a 
> lot of C++ to C code and fix a ton of build errors.
> This lead to architecture modules not getting updated. So there are many new 
> instructions in Capstone which are not supported.
> 
> The new updater will take away as much manual work as possible.
> It does this by translating most C++ to C via a little translation tool and 
> uses refactored LLVM-TableGen backends which emit directly the code Capstone 
> needs.
> Currently it is in a early stage but it is ready to receive some feedback.
> 
> If anyone finds the time to take a look at it and write down their thoughts, 
> suggestions or improvement ideas, I would be very grateful.
> 
> Capstone draft PR: https://github.com/capstone-engine/capstone/pull/1949

  Hi!

Thanks for the heads up! I see your pull request addresses the ARM part of 
Capstone, so I CC:-ed qemu-arm@nongnu.org in case anybody there wants to 
give it a try.

 From my personal point of view, what I really would love to see is an 
update for sparc and mips in the next version of Capstone, so we could 
finally get of the old disas/sparc.c and disas/mips.c files in QEMU (which 
were still disassembling more instructions than Capstone 4.0, so we kept 
them ... but AFAIK the upstream LLVM code implemented many missing 
instructions in the past years, so if Capstone gets refreshed, it should be 
good enough to replace the old code now).

Do you have any plans to work on Sparc and Mips any time soon? If not, do 
you have some short (shell) instructions how the update process 
theoretically works - maybe someone else can help?

  Thanks,
   Thomas


