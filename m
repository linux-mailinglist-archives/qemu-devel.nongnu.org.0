Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85CBF5482A9
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Jun 2022 11:11:01 +0200 (CEST)
Received: from localhost ([::1]:43852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o0g68-0001ZZ-Kb
	for lists+qemu-devel@lfdr.de; Mon, 13 Jun 2022 05:11:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1o0g2Z-0000C4-KJ
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 05:07:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52563)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1o0g2W-00044X-Fd
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 05:07:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655111235;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SVVvKtBLtlmC2siYecxx+G9VLFaGLGpeb3o/vRt3UcA=;
 b=U2zHt3XdQQvkriJtMcmjGF4Nm5rhBNm2lzgRRLLfuD/yahSEa4DGxlnNq/jUdc0dRXWJ2X
 9cMoR0sTRE6hgqDrkGKZuFa5uoI9y8iW0+FVVLoVY+wyvfR/AGqd4fmwnX7htSqfg0YByR
 oOeSregYkOEzguybNVq32+ePpMSaUGA=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-634-oxLMexIHP_qblEYhndKuuw-1; Mon, 13 Jun 2022 05:07:14 -0400
X-MC-Unique: oxLMexIHP_qblEYhndKuuw-1
Received: by mail-ed1-f72.google.com with SMTP id
 n8-20020a05640205c800b00434fb0c150cso624321edx.19
 for <qemu-devel@nongnu.org>; Mon, 13 Jun 2022 02:07:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=SVVvKtBLtlmC2siYecxx+G9VLFaGLGpeb3o/vRt3UcA=;
 b=nwWW2ZEhaEsnhXaiO6m0q/5hqz/XPnXAW42vXNyG817h+ZdD50xSa8aSCVjmIXrLfo
 bnuTHhcmUKxAuEbkGmDWYsmYB5Gfz3EAD81JOBEEwXsS1tSKZo7+PnEqtqOBkuWtGkUX
 VsbWqP6eWekpHA0e4H05L4vT+RVYryPr6kXfRrATCUmwbuLIZ7xH5aFnbwBhin7WDkaC
 u6g5WiAjsmEVt/7B9aQ1AaehlGYtO5FSmnpilyY0bJ9UkUYP5k8kZcxPWb9YHCs+iYfS
 ArG4N8PqbWMvnWRYPpBrH2XlonaVMcGSOWkWl1MmlbsLQoa4vls8udq77CLlOWyml3cK
 +EQQ==
X-Gm-Message-State: AOAM533LCJlVDy0aBEdfdCpOdVUrALsE0oTUnKd2O5AcF2vT/lsHH3qJ
 Ywy/JbQeXUOX7rKCe97GMUZ6inhUnn8sQdo1YRwnlekjzI9ZLT1scoX6+WIOK63hOGQaDFQZK0A
 3+anc7Cm9pAn3t9E=
X-Received: by 2002:aa7:c054:0:b0:433:2d3b:10ed with SMTP id
 k20-20020aa7c054000000b004332d3b10edmr5147328edo.211.1655111233420; 
 Mon, 13 Jun 2022 02:07:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwPD0cru7GSOR4FdE5pVvtru/xOLXN9N/v37EYCGP3/9gjVkkdqZOk6r/Z+c55P2ikIXMZvhA==
X-Received: by 2002:aa7:c054:0:b0:433:2d3b:10ed with SMTP id
 k20-20020aa7c054000000b004332d3b10edmr5147289edo.211.1655111233032; 
 Mon, 13 Jun 2022 02:07:13 -0700 (PDT)
Received: from ?IPV6:2a02:8071:5056:d40:63e3:25a7:c1a1:4455?
 ([2a02:8071:5056:d40:63e3:25a7:c1a1:4455])
 by smtp.gmail.com with ESMTPSA id
 gl6-20020a170906e0c600b006fec63e564bsm3589811ejb.30.2022.06.13.02.07.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Jun 2022 02:07:12 -0700 (PDT)
Message-ID: <60566c7d-54da-eaec-647f-d05e96ead668@redhat.com>
Date: Mon, 13 Jun 2022 11:07:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v5 22/45] block: implemet bdrv_unref_tran()
Content-Language: en-US
To: Vladimir Sementsov-Ogievskiy <vladimir.sementsov-ogievskiy@openvz.org>,
 qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, kwolf@redhat.com, vsementsov@openvz.org,
 v.sementsov-og@mail.ru
References: <20220330212902.590099-1-vsementsov@openvz.org>
 <20220330212902.590099-23-vsementsov@openvz.org>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20220330212902.590099-23-vsementsov@openvz.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
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

On 30.03.22 23:28, Vladimir Sementsov-Ogievskiy wrote:
> Now nodes are removed during block-graph update transactions now? Look
> at bdrv_replace_child_tran: bdrv_unref() is simply postponed to commit
> phase.
>
> What is the problem with it?
>
> We want to make copy-before-write permissions strict: it should unshare
> write always, not only when it has at least one parent.

Looking over this patch in not too much detail (because I find it rather 
complicated), it looks OK to me; but this reason for why we need it 
doesn’t really satisfy me.  What is the problem with how CBW permissions 
work?  Is that really the only reason for this patch?

> But if so, we
> can't neither insert the filter nor remove it:
>
> To insert the filter, we should first do blockdev-add, and filter will
> unshare write on the child, so, blockdev-add will fail if disk is in
> use by guest.
>
> To remove the filter, we should first do a replace operations, which
> again leads to situation when the filter and old parent share one
> child, and all parent want write permission when the filter unshare it.
>
> The solution is first do both graph-modifying operations (add &
> replace, or replace & remove) and only then update permissions. But
> that is not possible with current method to transactionally remove the
> block node: if we just postpone bdrv_unref() to commit phase, than on
> prepare phase the node is not removed, and it still keep all
> permissions on its children.
>
> What to do? In general, I don't know. But it's possible to solve the
> problem for the block drivers that doesn't need access to their
> children on .bdrv_close(). For such drivers we can detach their
> children on prepare stage (still, postponing bdrv_close() call to
> commit phase). For this to work we of course should effectively reduce
> bs->refcnt on prepare phase as well.
>
> So, the logic of new bdrv_unref_tran() is:
>
> prepare:
>    decrease refcnt and detach children if possible (and if refcnt is 0)
>
> commit:
>    do bdrv_delete() if refcnt is 0
>
> abort:
>    restore children and refcnt
>
> What's the difficulty with it? If we want to transactionally (and with
> no permission change) remove nodes, we should understand that some
> nodes may be removed recursively, and finally we get several possible
> not deleted leaves, where permissions should be updated. How caller
> will know what to update? That leads to additional transaction-wide
> refresh_list variable, which is filled by various graph modifying
> function. So, user should declare referesh_list variable and do one or
> several block-graph modifying operations (that may probably remove some
> nodes), then user call bdrv_list_refresh_perms on resulting
> refresh_list.
>
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>


