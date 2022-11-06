Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00E2061E186
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Nov 2022 11:15:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1orcev-0000rL-GD; Sun, 06 Nov 2022 05:13:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1orceo-0000po-M7
 for qemu-devel@nongnu.org; Sun, 06 Nov 2022 05:13:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1orcel-00053m-Mm
 for qemu-devel@nongnu.org; Sun, 06 Nov 2022 05:13:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667729614;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gy6sy6y++mj4WfXWzGGFNgGlEpl7nhv8IFyXQpC7EYU=;
 b=LtciByDtGajemftByvkCXqsAst5ljoa/XUlRjaREtDKCTjl12yz9PP2Y3YlMhN5npqK7ib
 GsQgrpDSAd6lMrzOdC6C9sbRiZGzsF/7QoDeB4d+nCLhZkTxPWms5VtvehDPI7xcEvG5an
 SyjUlMiMtTNGaNAuKZWAMa7n8DPIfmE=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-208-GSvxhKHTMwu_mwXemXEWsA-1; Sun, 06 Nov 2022 05:13:33 -0500
X-MC-Unique: GSvxhKHTMwu_mwXemXEWsA-1
Received: by mail-wm1-f72.google.com with SMTP id
 c130-20020a1c3588000000b003b56be513e1so4641517wma.0
 for <qemu-devel@nongnu.org>; Sun, 06 Nov 2022 02:13:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gy6sy6y++mj4WfXWzGGFNgGlEpl7nhv8IFyXQpC7EYU=;
 b=tvHxTzkySEFvn1bAU6i96xHdX6/Qnmc2U48qM/zM+4Wg4latgR4F3lvKb8/8IJQdWf
 0m59Bc2i8AOH/RdX262uGBERuZmhKIxKie6GMeQ50ALgjD6Fr3bV1G1X8uLXYv7Ob2Nx
 r5anHSpArBzx/KzUGUqnJW2WLHpxdQaWdNejOBa4v0wLYLJd25cFcYHC3zhn/vD2ABAC
 m6xluYIs8ieRsKCzIUOMRissRC3rQ/5qUhBUSEMDyG2/iI7xu4+e0tEEAwiFTTBe5fcn
 HyznV2xcF9Fn0ZtKyoo5sSuAcjLT2oCNQyIfzGiSNg5otO6YHFJYYYUGrsfjlIoffbh0
 m1SA==
X-Gm-Message-State: ACrzQf1/Rre3NSKBFJhQ06eBPYVbxakko02edKeBL97rLuhs0NhvOlGa
 cHPRtTIMICRQeyDRoesEAFX1smLvPaEfo8HhqjQv6cqTMR3ASFA+X91E7Knw06tMDkqi7LRexcu
 gNCWAvmwe1IAFMKc=
X-Received: by 2002:adf:cd09:0:b0:236:659a:6902 with SMTP id
 w9-20020adfcd09000000b00236659a6902mr28762379wrm.574.1667729612001; 
 Sun, 06 Nov 2022 02:13:32 -0800 (PST)
X-Google-Smtp-Source: AMsMyM5v1S2kKuS5zlfz02mxn4/ClOao2gbsOFHyU1QNB0WAs16u7/hQQahGHfppdSmWk5wyd5XHjg==
X-Received: by 2002:adf:cd09:0:b0:236:659a:6902 with SMTP id
 w9-20020adfcd09000000b00236659a6902mr28762366wrm.574.1667729611730; 
 Sun, 06 Nov 2022 02:13:31 -0800 (PST)
Received: from [192.168.8.100] (tmo-067-175.customers.d1-online.com.
 [80.187.67.175]) by smtp.gmail.com with ESMTPSA id
 v11-20020a05600c12cb00b003cf75f56105sm5442507wmd.41.2022.11.06.02.13.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 06 Nov 2022 02:13:31 -0800 (PST)
Message-ID: <82c388d0-c79b-36cb-e312-1a7c451200e8@redhat.com>
Date: Sun, 6 Nov 2022 11:13:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v2] s390x/css: revert SCSW ctrl/flag bits on error
Content-Language: en-US
To: Eric Farman <farman@linux.ibm.com>, Peter Jin <pjin@linux.ibm.com>,
 pasic@linux.ibm.com, borntraeger@linux.ibm.com,
 richard.henderson@linaro.org, david@redhat.com, cohuck@redhat.com,
 mjrosato@linux.ibm.com
Cc: peter@peterjin.org, qemu-s390x@nongnu.org, qemu-devel@nongnu.org
References: <20221027212341.2904795-1-pjin@linux.ibm.com>
 <3a265985495a653b0cb5b4a1cf2cfad29f734dc0.camel@linux.ibm.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <3a265985495a653b0cb5b4a1cf2cfad29f734dc0.camel@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.045,
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

On 28/10/2022 22.22, Eric Farman wrote:
> On Thu, 2022-10-27 at 23:23 +0200, Peter Jin wrote:
>> Revert the control and flag bits in the subchannel status word in
>> case
>> the SSCH operation fails with non-zero CC (ditto for CSCH and HSCH).
>> According to POPS, the control and flag bits are only changed if
>> SSCH,
>> CSCH, and HSCH return CC 0, and no other action should be taken
>> otherwise.
>> In order to simulate that after the fact, the bits need to be
>> reverted on
>> non-zero CC.
>>
> 
> I'm okay to this point...
> 
>> This change is necessary due to the fact that the pwrite() in vfio-
>> ccw
>> which triggers the SSCH can fail at any time. Previously, there was
>> only virtio-ccw, whose do_subchannel_work function was only able to
>> return CC0. However, once vfio-ccw went into the mix, it has become
>> necessary to handle errors in code paths that were previously assumed
>> to always return success.
>>
>> In our case, we found that in case of pwrite() failure (which was
>> discovered by strace injection), the subchannel could be stuck in
>> start
>> pending state, which could be problematic if the pwrite() call
>> returns
>> CC2. Experimentation shows that the guest tries to retry the SSCH
>> call as
>> normal for CC2, but it actually continously fails due to the fact
>> that
>> the subchannel is stuck in start pending state even though no start
>> function is actually taking place.
> 
> ...but the two paragraphs above are a bit cumbersome to digest. Maybe
> it's just too late in the week for me. What about something like this?
> 
> """
> While the do_subchannel_work logic for virtual (virtio) devices will
> return condition code 0, passthrough (vfio) devices may encounter
> errors from either the host kernel or real hardware that need to be
> accounted for after this point. This includes restoring the state of
> the Subchannel Status Word to reflect the subchannel, as these bits
> would not be set in the event of a non-zero condition code from the
> affected instructions.
> 
> Experimentation has shown that a failure on a START SUBCHANNEL (SSCH)
> to a passthrough device would leave the subchannel with the START
> PENDING activity control bit set, thus blocking subsequent SSCH
> operations in css_do_ssch() until some form of error recovery was
> undertaken since no interrupt would be expected.
> """
> 
>>
>> Signed-off-by: Peter Jin <pjin@linux.ibm.com>
> 
> We've talked previously about clearing this within the
> do_subchannel_work_passthrough routine in order to keep the _virtual
> paths untouched, but this seems like a reasonable approach to me.
> 
> The commit message is probably fine either way, but as far as the code
> goes:
> 
> Reviewed-by: Eric Farman <farman@linux.ibm.com>

Thanks, I've queued the patch now to my s390x-next branch with the updated 
commit message. Please double-check whether that looks OK now:

  https://gitlab.com/thuth/qemu/-/commits/s390x-next/

  Thomas


