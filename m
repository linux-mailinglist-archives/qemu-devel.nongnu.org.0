Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B792E33B1C3
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 12:52:58 +0100 (CET)
Received: from localhost ([::1]:60198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLlmL-0002hg-PW
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 07:52:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42792)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lLliB-0008LG-2M
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 07:48:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60956)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lLli6-0007SL-PZ
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 07:48:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615808913;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PWwxHLi9dgTNTHE0LCBl/AyBXCQsukfZY9OphtzFP/Q=;
 b=CgHpl8J0YGK0Ak0MriH3Jks08E87Lmgy3JZxciUlXtGRbSbQ+xXQHA2AfSbHI9ls2iyeLi
 Nikr3UtnYqoefTu6rnpEsLswyyN+TXHcpn6DthbKJiVHw08MMys4qMpiOLYhH9IJBfaYNm
 Qk99yMRzMyLqvXWNmePaJOplwgq1Hzc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-433-OVzzYl7eMBO6GH7M9oeXuw-1; Mon, 15 Mar 2021 07:48:29 -0400
X-MC-Unique: OVzzYl7eMBO6GH7M9oeXuw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 691B8107ACCA;
 Mon, 15 Mar 2021 11:48:28 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-115-128.ams2.redhat.com [10.36.115.128])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9BE50620DE;
 Mon, 15 Mar 2021 11:48:19 +0000 (UTC)
Date: Mon, 15 Mar 2021 12:48:18 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH v3 22/30] qom: Factor out user_creatable_process_cmdline()
Message-ID: <YE9JglNKEYwh2S0J@merkur.fritz.box>
References: <20210308165440.386489-1-kwolf@redhat.com>
 <20210308165440.386489-23-kwolf@redhat.com>
 <87h7lfwim1.fsf@dusky.pond.sub.org>
MIME-Version: 1.0
In-Reply-To: <87h7lfwim1.fsf@dusky.pond.sub.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: lvivier@redhat.com, thuth@redhat.com, pkrempa@redhat.com,
 berrange@redhat.com, ehabkost@redhat.com, qemu-block@nongnu.org,
 libvir-list@redhat.com, jasowang@redhat.com, qemu-devel@nongnu.org,
 mreitz@redhat.com, kraxel@redhat.com, pbonzini@redhat.com, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 13.03.2021 um 09:41 hat Markus Armbruster geschrieben:
> Observation, not objection:
> 
> 1. QMP core parses JSON text into QObject, passes to generated
>    marshaller.
> 
> 2. Marshaller converts QObject to ObjectOptions with the QObject input
>    visitor, passes to qmp_object_add().
> 
> 3. qmp_object_add() wraps around user_creatable_add_qapi().
> 
> 4. user_creatable_add_qapi() converts right back to QObject with the
>    QObject output visitor.  It splits the result into qom_type, id and
>    the rest, and passes all three to user_creatable_add_type().
> 
> 5. user_creatable_add_type() performs a virtual visit with the QObject
>    input visitor.  The outermost object it visits itself, its children
>    it visits by calling object_property_set().
> 
> I sure hope we wouldn't write it this way from scratch :)
> 
> I think your patch is a reasonable step towards a QOM that is at peace
> with QAPI.  But there's plenty of work left.

Yes, obviously the conversion back to QObject is not great. There are
two reasons why we currently need it:

1. user_creatable_add_type() wants to iterate over all properties
   without knowing which properties exist. This should be fixed by not
   visiting the top level in user_creatable_add_type(), but moving this
   part to object-specific code (in the final state probably code
   generated from the QAPI schema).

2. We have ObjectOptions, but need to pass a visitor. We don't have a
   general purpose visitor that visits both sides. The clone visitor
   seems somewhat similar to what we need, but I seem to remember it was
   more restricted to its particular use case.

Kevin


