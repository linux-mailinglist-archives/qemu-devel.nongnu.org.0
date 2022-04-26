Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 033CC50F35F
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 10:07:31 +0200 (CEST)
Received: from localhost ([::1]:58686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njGEL-00034s-UW
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 04:07:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1njG5R-0008T6-0K
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 03:58:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38076)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1njG5N-0000Vm-W8
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 03:58:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650959882;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vvRwr0dG2zp1FjGSruP7mJTDdV0MF0ZQSIqXbVGALkU=;
 b=cQEyno5AOn/3VVrR9ZzqUyjLGCbn5tDwDrwSgrZAKe7/aeAQ0EMP4z9fLVmvtQoj40VUax
 bgaw0iWs7zDq/r8EscWn39AP9zo8G2cQhaUIxY9zlsXffct4+f8iYM+aUmmGgnjhz075nU
 pZIbf/AparldO4nbAGSYWcoopnPbzC0=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-272-Y4M9AY48OamvdCpU14KbsA-1; Tue, 26 Apr 2022 03:58:01 -0400
X-MC-Unique: Y4M9AY48OamvdCpU14KbsA-1
Received: by mail-wr1-f71.google.com with SMTP id
 e13-20020adf9bcd000000b0020adc114131so1568703wrc.8
 for <qemu-devel@nongnu.org>; Tue, 26 Apr 2022 00:58:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=vvRwr0dG2zp1FjGSruP7mJTDdV0MF0ZQSIqXbVGALkU=;
 b=d65wufQWH+jauP33dyohWUDQ2x0TpbTHteDnsg8U3sFFuGg3nuLn2L70OHap+J+D2Z
 8rVbtLL+7GdtqBhQzJw4gb0wfkdD6LMPuHimRofe8JZwxW2+pOSPeQci2dgrP+ag4fS2
 DMS+CFPteVT6cydw4WcnAOGibraQL7Tkq9w+CwaxMu2Q+UmoaF1VUUzy2qcSgC8ALN9D
 3VcDxp8nXA1jk0/Z2ZuZVchlmqxy3JkNZZTUUkxpMbBf3xGN+zHH8uIkXD7I+tfVmNp3
 QuCr8cf18WxtOrIi0d0ezPBEWcwJkSj8ETZVpUp1STFSlUGOuHjO3pYWV8tAPNn6Sorv
 sNEQ==
X-Gm-Message-State: AOAM531IQTCQgc1Tn/JvMPNFrUCoY6w0grKggzqG1S/qaUGREDd92HhO
 qpWv3WCAguZ6v9xC6TpmOAFAa5o0KPwCAM/y3SN6YdUy9FyWdjqWiUy8uIwZ/doCsfgsziXllwW
 ffZALflg49TXrq3M=
X-Received: by 2002:a5d:588c:0:b0:20a:de98:f6be with SMTP id
 n12-20020a5d588c000000b0020ade98f6bemr5654824wrf.223.1650959879995; 
 Tue, 26 Apr 2022 00:57:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxckthmtj5VfCiFXJrjeT7LkWJ2AJ8jWBf63aKOEnEWqrpmNGSedUycEfSqdI9Y2MyeLDTmuA==
X-Received: by 2002:a5d:588c:0:b0:20a:de98:f6be with SMTP id
 n12-20020a5d588c000000b0020ade98f6bemr5654803wrf.223.1650959879730; 
 Tue, 26 Apr 2022 00:57:59 -0700 (PDT)
Received: from [10.33.192.232] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id
 e1-20020a05600c4e4100b00392910b276esm10434029wmq.9.2022.04.26.00.57.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Apr 2022 00:57:59 -0700 (PDT)
Message-ID: <d5063b82-da6c-d9fe-136b-56aea7b480e6@redhat.com>
Date: Tue, 26 Apr 2022 09:57:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PULL 0/6] Kraxel 20220425 patches
Content-Language: en-US
To: Gerd Hoffmann <kraxel@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20220425061029.3932731-1-kraxel@redhat.com>
 <4f3017ea-3f6b-dd43-275a-5012cf0f412a@linaro.org>
 <20220426071550.3y5h7ydyptppo777@sirius.home.kraxel.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220426071550.3y5h7ydyptppo777@sirius.home.kraxel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Cc: Beraldo Leal <bleal@redhat.com>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Cleber Rosa <crosa@redhat.com>, Eric Blake <eblake@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 26/04/2022 09.15, Gerd Hoffmann wrote:
> On Mon, Apr 25, 2022 at 10:21:00AM -0700, Richard Henderson wrote:
>> On 4/24/22 23:10, Gerd Hoffmann wrote:
>>> The following changes since commit a74782936dc6e979ce371dabda4b1c05624ea87f:
>>>
>>>     Merge tag 'pull-migration-20220421a' of https://gitlab.com/dagrh/qemu into staging (2022-04-21 18:48:18 -0700)
>>>
>>> are available in the Git repository at:
>>>
>>>     git://git.kraxel.org/qemu tags/kraxel-20220425-pull-request
>>>
>>> for you to fetch changes up to ef798418a3037434951002d0afc5f3d919e294db:
>>>
>>>     avocado/vnc: add test_change_listen (2022-04-22 13:43:28 +0200)
>>>
>>> ----------------------------------------------------------------
>>> vnc: add display-update monitor command.
>>> screendump: add png support.
>>> vmsvga: screen update fix.
>>>
>>> ----------------------------------------------------------------
>>>
>>> Carwyn Ellis (1):
>>>     hw/display/vmware_vga: do not discard screen updates
>>>
>>> Kshitij Suri (2):
>>>     Replacing CONFIG_VNC_PNG with CONFIG_PNG
>>>     Added parameter to take screenshot with screendump as PNG
>>>
>>> Vladimir Sementsov-Ogievskiy (3):
>>>     ui/vnc: refactor arrays of addresses to SocketAddressList
>>>     qapi/ui: add 'display-update' command for changing listen address
>>>     avocado/vnc: add test_change_listen
>>
>>
>> Fails testing with
>>
>>    ERROR: unknown option --disable-vnc-png
>>
>> See https://gitlab.com/qemu-project/qemu/-/jobs/2374050341
> 
> Hmm, how do I test that?  My CI run didn't include the centos test case
> for some reason: https://gitlab.com/kraxel/qemu/-/pipelines/522456078

The failed job was a custom test runner (i.e. on a dedicated non-gitlab 
machine), not a shared runner, so these are not run unless you add a runner 
machine to your test set on your own.

For this problem here, you've got to update 
scripts/ci/org.centos/stream/8/x86_64/configure , I think.

  HTH,
   Thomas


