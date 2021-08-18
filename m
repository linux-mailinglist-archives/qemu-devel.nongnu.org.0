Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47BF63EFFBF
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Aug 2021 10:59:05 +0200 (CEST)
Received: from localhost ([::1]:55434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGHPc-0005mt-Ap
	for lists+qemu-devel@lfdr.de; Wed, 18 Aug 2021 04:59:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51968)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1mGHOe-0004re-97
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 04:58:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41954)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1mGHOc-00023A-1e
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 04:58:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629277080;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ugvqCppE31yPVRX2PPY3+BGr068NgzxoeWuPEHBPN6k=;
 b=bxNDP09rqdSv3OV2UzoHYwK+gBjZUzq+xP/Bjom9ebZC1am/S1tQDnNRHwb1RrNrD3/vun
 I5sgBnmicBqb4ju58Qi2QvcQqYaBd0/w09T1lzFOQXXt1sDeaskpafMkYYRSoD1wXuyJST
 ybIESzyYYufLi41pSRfEwSfIXDUNMPs=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-593-qwYi3m6MPm-CEEJosvpxhg-1; Wed, 18 Aug 2021 04:57:59 -0400
X-MC-Unique: qwYi3m6MPm-CEEJosvpxhg-1
Received: by mail-ej1-f72.google.com with SMTP id
 x5-20020a1709064bc5b02905305454f5d1so613411ejv.10
 for <qemu-devel@nongnu.org>; Wed, 18 Aug 2021 01:57:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=ugvqCppE31yPVRX2PPY3+BGr068NgzxoeWuPEHBPN6k=;
 b=cRvhxkj3lA13r5ChioZ1p8ODKknzRoV2iQEPFB8TC+tal1p1QTdUMGeXx27NvZczbt
 XeEK7hOg8CR/gNfNDggErpqVq8Z0b9DxFTU3mmf1+fWsQ7ApUmBkUrhmQwfR+rGjU+wQ
 +X90hG06+rGtkmugVl8AYWNo8mOXW1ThlYDYwLMIPtbaWwTj3HJZxCLtoWCIiRhiKB7a
 1uJmJtWDNOA1hbYxL6z0u58b6h67ZoXOy/3CSzYqToAuamNCsU6anjgS61sUWilZHlCS
 NUiw/P1hBZUQ9SRRPFGJ67+gR2RtNxQHzM8/uSeqSNhNggERYvBpCAU/+1FgLEokzuYJ
 FpZg==
X-Gm-Message-State: AOAM530KYeQdJH4jxboz5DBqpB789Sz/UuXgZNQ1PojDAY3ZQ9E60Acd
 lJvoIZc9bZqbkE/P/Dzi2mx1FU9KEgN7nYWP/vC1klFg0du+xkNdSYVofwMRRpw7iV85b7jBs2t
 rxYnLQvTLmVuM0nA=
X-Received: by 2002:a05:6402:10cc:: with SMTP id
 p12mr9006445edu.328.1629277078600; 
 Wed, 18 Aug 2021 01:57:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz/RW9AFpg079B2kJbA9Bze1MP82C1kmCX/ulk+KMqvmMGjMKcxuM/jFTqvIJQFV4H29hCZqg==
X-Received: by 2002:a05:6402:10cc:: with SMTP id
 p12mr9006414edu.328.1629277078321; 
 Wed, 18 Aug 2021 01:57:58 -0700 (PDT)
Received: from gator.home (cst2-174-132.cust.vodafone.cz. [31.30.174.132])
 by smtp.gmail.com with ESMTPSA id m5sm1745452ejg.53.2021.08.18.01.57.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Aug 2021 01:57:58 -0700 (PDT)
Date: Wed, 18 Aug 2021 10:57:56 +0200
From: Andrew Jones <drjones@redhat.com>
To: "ishii.shuuichir@fujitsu.com" <ishii.shuuichir@fujitsu.com>
Subject: Re: [PATCH v4 1/3] target-arm: Add support for Fujitsu A64FX
Message-ID: <20210818085756.33lvgz2b6wnhwjn4@gator.home>
References: <20210812060440.1330348-2-ishii.shuuichir@fujitsu.com>
 <20210812091650.i5np3szvdoelu2cx@gator.home>
 <20210812092517.mwcfhksoe4cgy3cl@gator.home>
 <TYCPR01MB6160B0A6E08CAE7CB2C6D8F0E9FE9@TYCPR01MB6160.jpnprd01.prod.outlook.com>
 <20210817115635.d2wxvnvis5kupegh@gator.home>
 <667f9384-cd28-8e4d-ebd1-4ed4b651676a@linaro.org>
 <20210817153639.o5fxdgmuhjusvyhq@gator.home>
 <3846b738-719f-a9a1-a59d-d7f54e71009c@linaro.org>
 <20210817162811.u3i5hcx7eg52akyq@gator.home>
 <TYCPR01MB6160151837F9C9C4167BB1B9E9FF9@TYCPR01MB6160.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <TYCPR01MB6160151837F9C9C4167BB1B9E9FF9@TYCPR01MB6160.jpnprd01.prod.outlook.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Aug 18, 2021 at 08:29:15AM +0000, ishii.shuuichir@fujitsu.com wrote:
> 
> We appreciate everyone's comments.
> Before making the V5 patch, please let me check the patch contents.
> 
> > This looks reasonable to me, but you also need the 'sve' property that states sve in
> > supported at all.
> > > > So maybe we should just go ahead and add all sve* properties, 
> 
> In response to the above comment,
> We understood that the sve property will be added to the v4 patch.
> 
> i.e. 
> (QEMU) query-cpu-model-expansion type=full model={"name":"a64fx"}
> {"return": {"model": {"name": "a64fx", "props": {"sve128": false, "sve256": true, "sve": true, "sve512": true, "aarch64": true, "pmu": true}}}}
> 
> > > > but
> > > > then make sure the default vq map is correct.
> 
> Furthermore, We understood that I need to add the above process as well, is that correct?
> 
> > That's a good idea. I'll send a patch with your suggested-by.
> 
> If that's correct,
> In the current v4 patch, in the aarch64_a64fx_initfn function, 
> the a64fx_cpu_set_sve function is executed to set the SVE property, 
> and the arm_cpu_sve_finalize function is not called. 
> 
> In which function is it appropriate to execute the modulo max_vq function 
> (or equivalent process)?
> 
> If We are not understanding you correctly,
> We would appreciate your comments.

Richard's suggestion is to generalize the "supported" bitmap concept,
which is currently only used for KVM, in order to also use it for
TCG cpu models. The 'max' cpu type will have the trivial all-set
supported bitmap, but the a64fx will have a specific one. I plan to
do this "supported" bitmap generalization and apply it to the TCG
max cpu type. You'll need to rebase this series on those patches and
provide the a64fx supported bitmap.

I think this will be more clear once I get the patch posted (which I
haven't started writing yet). I'll try to get it posted by tomorrow
evening though, since I have vacation on Friday.

Thanks,
drew


> 
> Best regards.
> 
> > -----Original Message-----
> > From: Andrew Jones <drjones@redhat.com>
> > Sent: Wednesday, August 18, 2021 1:28 AM
> > To: Richard Henderson <richard.henderson@linaro.org>
> > Cc: Ishii, Shuuichirou/石井 周一郎 <ishii.shuuichir@fujitsu.com>;
> > peter.maydell@linaro.org; qemu-arm@nongnu.org; qemu-devel@nongnu.org
> > Subject: Re: [PATCH v4 1/3] target-arm: Add support for Fujitsu A64FX
> > 
> > On Tue, Aug 17, 2021 at 05:53:34AM -1000, Richard Henderson wrote:
> > > On 8/17/21 5:36 AM, Andrew Jones wrote:
> > > > On Tue, Aug 17, 2021 at 05:23:17AM -1000, Richard Henderson wrote:
> > > > > On 8/17/21 1:56 AM, Andrew Jones wrote:
> > > > > > I guess it's fine. You could easily create a new
> > > > > > cpu_arm_set_sve_vq() which would forbid changing the properties
> > > > > > if you wanted to, but then we need to answer Peter's question in
> > > > > > order to see if there's a precedent for that type of property.
> > > > >
> > > > > I don't see the point in read-only properties.  If the user wants
> > > > > to set non-standard values on the command-line, let them.  What is
> > > > > most important is getting the correct default from '-cpu a64fx'.
> > > > >
> > > >
> > > > So maybe we should just go ahead and add all sve* properties, but
> > > > then make sure the default vq map is correct.
> > >
> > > I think that's the right answer.
> > >
> > > Presently we have a kvm_supported variable that's initialized by
> > > kvm_arm_sve_get_vls().  I think we want to rename that variable and
> > > provide a version of that function for tcg. Probably we should have
> > > done that before, with a trivial function for -cpu max to set all bits.
> > >
> > > Then eliminate most of the other kvm_enabled() checks in
> > > arm_cpu_sve_finalize.  I think the only one we keep is the last, where
> > > we verify that the final sve_vq_map matches kvm_enabled exactly, modulo
> > max_vq.
> > >
> > > This should minimize the differences in behaviour between tcg and kvm.
> > 
> > That's a good idea. I'll send a patch with your suggested-by.
> > 
> > Thanks,
> > drew
> 


