Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D6F4628E36
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 01:22:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ouinO-0007aS-AF; Mon, 14 Nov 2022 18:23:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ouif9-00039s-JG
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 18:14:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1oub5k-0006qu-DH
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 10:09:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668438583;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=a+UaLhWETl2WiMSsgvgr0af0adv3SAGL74JU7I8RYkI=;
 b=RuwAZpfo5URRPyBo5CMku660mjZ3oJhGDDMDvuXy4HYiRVeXhDSScOgABdrm2xrkcrOIcj
 3EGDh+QTuhBRZ9QQNs7SxYeVeNAO2S5yz/STeYLTzyBgByce/1DhK/5/oWwdYlaFlAYOJa
 QJ3AzcBqJM1CUwT81LiJ6BEX0v6eWXM=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-655-FcB6paDoM12EFQqcd8mbrA-1; Mon, 14 Nov 2022 10:09:42 -0500
X-MC-Unique: FcB6paDoM12EFQqcd8mbrA-1
Received: by mail-wm1-f69.google.com with SMTP id
 c10-20020a7bc84a000000b003cf81c2d3efso2999272wml.7
 for <qemu-devel@nongnu.org>; Mon, 14 Nov 2022 07:09:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=a+UaLhWETl2WiMSsgvgr0af0adv3SAGL74JU7I8RYkI=;
 b=vWyCGxvzb4Qq1Mf2Y4KXzlOV4b5ee3acBHaBXnWuspUmAWNDqgJIgRJ/BikVtC32Ve
 IpXZISmCYHTU+eao693QBtUKgrp/E4RNgglCodjWH0jLq0bb+mAAs+yXR5/5oclIa5rI
 Dq1+59OSaYtDCfJ/9brYjJ+c8Fm7XFukDal0oHpP4p1UIosRivmQhmk88c76uPe72LYi
 xkG71r7ObacJgDHD4nAsKdKBcDx68BS2cDOo4HXPaPLO9oxcqxDTJfAVUw/92ScQX526
 tHvKsLOiKWFcAVbqdSkkJrOgCZqiibY4Ik63OYLZBd/0jmsPOkbRAe5mIx2nJxnZuBH+
 Pm6w==
X-Gm-Message-State: ANoB5pl7gDl3UjTtJi8xF4T1Bq6/jcstW5K2D7f9thxjKEd6lhi7SN1c
 i//fHiFn6URMSHoyNX897S7/z9RRB1Jzi7hF6RQHrm7SMw1yTq/reydQF2iwCSro1c3iwxXA01s
 pyNJGfYPu2Eqvy5M=
X-Received: by 2002:a5d:63c3:0:b0:241:5d1d:955b with SMTP id
 c3-20020a5d63c3000000b002415d1d955bmr7861295wrw.254.1668438580893; 
 Mon, 14 Nov 2022 07:09:40 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6oPH4cSox6gvMPt/Op0/P+am3ZcK9Ec26lIyl6VMbHQkY/0oaYJeCFGGCRelh9BNAqYKG7/w==
X-Received: by 2002:a5d:63c3:0:b0:241:5d1d:955b with SMTP id
 c3-20020a5d63c3000000b002415d1d955bmr7861274wrw.254.1668438580644; 
 Mon, 14 Nov 2022 07:09:40 -0800 (PST)
Received: from localhost ([31.4.176.155]) by smtp.gmail.com with ESMTPSA id
 k3-20020adfd223000000b00236e834f050sm9691093wrh.35.2022.11.14.07.09.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Nov 2022 07:09:40 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Peter Xu <peterx@redhat.com>
Cc: qemu-devel@nongnu.org,  "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>,  ani@anisinha.ca,  Leonardo
 Bras Soares Passos <lsoaresp@redhat.com>,  Manish Mishra
 <manish.mishra@nutanix.com>
Subject: Re: [PATCH v2 05/15] migration: Remove RAMState.f references in
 compression code
In-Reply-To: <20221011215559.602584-6-peterx@redhat.com> (Peter Xu's message
 of "Tue, 11 Oct 2022 17:55:49 -0400")
References: <20221011215559.602584-1-peterx@redhat.com>
 <20221011215559.602584-6-peterx@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.1 (gnu/linux)
Date: Mon, 14 Nov 2022 16:09:38 +0100
Message-ID: <87wn7xa7yl.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Reply-To: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Peter Xu <peterx@redhat.com> wrote:
> Removing referencing to RAMState.f in compress_page_with_multi_thread() and
> flush_compressed_data().
>
> Compression code by default isn't compatible with having >1 channels (or it
> won't currently know which channel to flush the compressed data), so to
> make it simple we always flush on the default to_dst_file port until
> someone wants to add >1 ports support, as rs->f right now can really
> change (after postcopy preempt is introduced).
>
> There should be no functional change at all after patch applied, since as
> long as rs->f referenced in compression code, it must be to_dst_file.
>
> Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> Signed-off-by: Peter Xu <peterx@redhat.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>


