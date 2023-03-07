Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 678A06AE6DE
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 17:40:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZaLq-0000mX-Ly; Tue, 07 Mar 2023 11:39:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1pZaLj-0000fx-BY
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 11:39:39 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1pZaLh-00047p-OZ
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 11:39:39 -0500
Received: by mail-wm1-x32e.google.com with SMTP id j3so8214028wms.2
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 08:39:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678207176;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:from:to:cc:subject:date:message-id:reply-to;
 bh=L//rXDlKqzEMIkgwZ3oxBiFvOxaRWL3SJBF76UN8nUI=;
 b=gjTI2LnHpSUTYtcVwjHTpPBNJmXLRQXCHoUgY6B17wxb8Y9Oq2K03Cxpw9nRMyIHjI
 r7kstc2Nu9xaP3+KFEqeJmB0VjY/wYRmf9XwsWaYWBQfz6rKRN1OdorZ9VPT79XcMfzr
 ME+bvaAQqxqhq+1ZbcNG7mhLGI0ETvLXcgBwuybwRsyd40hTq5OaeW7XhvSLnPcWw/uv
 s4evxWJCEbe0bwvHXsAFlYNAm+/L+SIoHGG8vzn5tbCLDVAZjF1Vrx1uNdGrZOklb+8z
 gqjH8IP4JsPxTTrZPihTOofvaA+IR6470YIzZTa/o6hO0kVCmW0AQ35l/Mr8s6y4Mn61
 NVbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678207176;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=L//rXDlKqzEMIkgwZ3oxBiFvOxaRWL3SJBF76UN8nUI=;
 b=wlsCk3AUikWHwgq8BskzAPnE39u31hnNpQDJ0aVL11FAFq9DzLWGkmdeKa/Wsidk9u
 leXk20s9kjTaPQdhFpXDnijmXiLKrRb67V5WsJTZNzJrZNAn6fFYM5My7BeNjwI4/ICD
 cNnK1axjjGVKKamcF4Te6Zonhl7YvwZ0k0hwlnNIkxb3/FeTaXl6TRlSpR9w9fv3pUx4
 rwI4GTxGAENyPJDBFvPBFidSvrQjnMshUievgQ6thfsv7cJ4JWJ9YxMDEA+l9HSMH28k
 jUdI1J3o4i8HnjlM79BqLzmhfThQ0EcjktzzOrxlWfeRJHeGGIUpIYcwloK21Y/tLbel
 L1aw==
X-Gm-Message-State: AO0yUKVQKOcZn5tMFy0jYRYdz8b2Tlmz17Xj7OFgqPdyLUIQe3oKumRO
 6Mu+77daM74qyTCmNapGBqg=
X-Google-Smtp-Source: AK7set8jBCCEPQWdi9BtsTQEIBjJwDZXJkCBMeQntK6DMuwwruJy0VyvZVk32HTTVhWJO5C0TGIDEA==
X-Received: by 2002:a05:600c:1c1f:b0:3eb:246d:7efd with SMTP id
 j31-20020a05600c1c1f00b003eb246d7efdmr12902808wms.2.1678207176053; 
 Tue, 07 Mar 2023 08:39:36 -0800 (PST)
Received: from [192.168.25.218] (54-240-197-238.amazon.com. [54.240.197.238])
 by smtp.gmail.com with ESMTPSA id
 i16-20020a05600c355000b003dc4480df80sm19079797wmq.34.2023.03.07.08.39.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Mar 2023 08:39:35 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <e1e4f027-25bc-2e1c-4451-b4d304493f16@xen.org>
Date: Tue, 7 Mar 2023 16:39:34 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [RFC PATCH v1 07/25] hw/xen: Implement core serialize/deserialize
 methods for xenstore_impl
Content-Language: en-US
To: David Woodhouse <dwmw2@infradead.org>, qemu-devel@nongnu.org,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Joao Martins <joao.m.martins@oracle.com>,
 Ankur Arora <ankur.a.arora@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>, vikram.garhwal@amd.com,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
References: <20230302153435.1170111-1-dwmw2@infradead.org>
 <20230302153435.1170111-8-dwmw2@infradead.org>
 <5f03307a80c33b62380128bf3f638d47eca74357.camel@infradead.org>
Organization: Xen Project
In-Reply-To: <5f03307a80c33b62380128bf3f638d47eca74357.camel@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=xadimgnik@gmail.com; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: paul@xen.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 07/03/2023 16:33, David Woodhouse wrote:
> On Thu, 2023-03-02 at 15:34 +0000, David Woodhouse wrote:
>> From: David Woodhouse <dwmw@amazon.co.uk>
>>
>> In fact I think we want to only serialize the contents of the domain's
>> path in /local/domain/${domid} and leave the rest to be recreated? Will
>> defer to Paul for that.
>>
>> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> 
> Paul, your Reviewed-by: on this one is conspicuous in its absence. I
> mentioned migration in the cover letter — this much is working fine,
> but it's the PV back ends that don't yet work.
> 
> I'd quite like to merge the basic serialization/deserialization of
> XenStore itself, with the unit tests.

The patch is basically ok, I just think the serialization should be 
limited to the guest nodes... filtering out those not owned by xen_domid 
would probably work for that.

> 
> Perhaps we can also set TYPE_XEN_DEVICE or TYPE_XEN_BLOCK_DEVICE to be
> unmigratable? Ideally I think we want TYPE_XEN_DEVICE to be
> unmigratable by default *unless* the specific device class (including
> net and other as we port them from XenLegacyDevice) says otherwise.
> 

Yes, that sounds like a good idea.

> Is there a way to do that?

Not something I've looked into. I'll go look now.

   Paul

