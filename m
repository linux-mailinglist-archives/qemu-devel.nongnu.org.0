Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79472417B3F
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 20:43:45 +0200 (CEST)
Received: from localhost ([::1]:55980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTqAi-0005jf-79
	for lists+qemu-devel@lfdr.de; Fri, 24 Sep 2021 14:43:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mTq86-0003gR-Rl
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 14:41:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60628)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mTq81-0008CO-FO
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 14:41:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632508855;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=z+QS0h8twcEc9N86L0sC5z2V31zU/GIhSESTCUhgCGM=;
 b=TbTAcTDPBVXVcrTb8QSwsBLArltI8LEayuzYxR24LE5Rn3hempECXTlk4BBw7Z7A1QCtUj
 z9zHRzqmxqE29ASu3xR1r1ks3omX21Tr7PK7gva56Mv+zbQum997TCDBF7l9nbCiR0ASpj
 CePTsitgYGKuC3iQ75GObEuffo7WWyM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-195-kozDW21-MYuac9zmGM8qhQ-1; Fri, 24 Sep 2021 14:40:52 -0400
X-MC-Unique: kozDW21-MYuac9zmGM8qhQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 380E81084684;
 Fri, 24 Sep 2021 18:40:51 +0000 (UTC)
Received: from redhat.com (ovpn-115-8.phx2.redhat.com [10.3.115.8])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0ECE260BF4;
 Fri, 24 Sep 2021 18:40:47 +0000 (UTC)
Date: Fri, 24 Sep 2021 13:40:46 -0500
From: Eric Blake <eblake@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PATCH 04/11] qdev: Avoid using string visitor for properties
Message-ID: <20210924184046.dlrrycadjdfssaoz@redhat.com>
References: <20210924090427.9218-1-kwolf@redhat.com>
 <20210924090427.9218-5-kwolf@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210924090427.9218-5-kwolf@redhat.com>
User-Agent: NeoMutt/20210205-773-8890a5
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.473,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: pkrempa@redhat.com, ehabkost@redhat.com, qemu-block@nongnu.org,
 libvir-list@redhat.com, armbru@redhat.com, qemu-devel@nongnu.org,
 its@irrelevant.dk, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Sep 24, 2021 at 11:04:20AM +0200, Kevin Wolf wrote:
> The only thing the string visitor adds compared to a keyval visitor is
> list support. git grep for 'visit_start_list' and 'visit.*List' shows
> that devices don't make use of this.
> 
> In a world with a QAPIfied command line interface, the keyval visitor is
> used to parse the command line. In order to make sure that no devices
> start using this feature that would make backwards compatibility harder,
> just switch away from object_property_parse(), which internally uses the
> string visitor, to a keyval visitor and object_property_set().
> 
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> ---
>  softmmu/qdev-monitor.c | 20 +++++++++++++++++---
>  1 file changed, 17 insertions(+), 3 deletions(-)

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


