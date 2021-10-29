Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D6EE43FFAA
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 17:35:16 +0200 (CEST)
Received: from localhost ([::1]:42560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgTuV-0006rx-9y
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 11:35:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mgToN-00082h-6h
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 11:28:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50745)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mgToJ-0002HL-DH
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 11:28:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635521330;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2XCgoKPEXun2mHBpi1DqxM/oW09u3AOQZgSW87SLbgw=;
 b=XdNDtjsC/IOmhsHytcYi3G8KD5+wp2YinAZ0KEw89bCL03+f2cl3eRK1rus9TvPO4QcsSu
 G94g4efjjY5DrbdeLzSOZEGlU3gwN/Vtxd1B1QvYmZVtDxVst+djnAocl3dJGy9wEYzSoG
 0uMaj3zPnmfGeiyEAa43Tk1dG6lfYbg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-284-XEyv17gqO-2zMzSQY5becg-1; Fri, 29 Oct 2021 11:28:49 -0400
X-MC-Unique: XEyv17gqO-2zMzSQY5becg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8C69F806688;
 Fri, 29 Oct 2021 15:28:48 +0000 (UTC)
Received: from redhat.com (ovpn-112-232.phx2.redhat.com [10.3.112.232])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DDF855F4EC;
 Fri, 29 Oct 2021 15:28:12 +0000 (UTC)
Date: Fri, 29 Oct 2021 10:28:11 -0500
From: Eric Blake <eblake@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH v2 6/9] qapi: Generalize command policy checking
Message-ID: <20211029152811.usdi6bp7wsmlwn2d@redhat.com>
References: <20211028102520.747396-1-armbru@redhat.com>
 <20211028102520.747396-7-armbru@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211028102520.747396-7-armbru@redhat.com>
User-Agent: NeoMutt/20211022
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: kwolf@redhat.com, pkrempa@redhat.com, berrange@redhat.com,
 ehabkost@redhat.com, qemu-block@nongnu.org, quintela@redhat.com,
 libvir-list@redhat.com, philmd@redhat.com, kchamart@redhat.com,
 qemu-devel@nongnu.org, mdroth@linux.vnet.ibm.com, dgilbert@redhat.com,
 pbonzini@redhat.com, marcandre.lureau@redhat.com, jsnow@redhat.com,
 libguestfs@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Oct 28, 2021 at 12:25:17PM +0200, Markus Armbruster wrote:
> The code to check command policy can see special feature flag
> 'deprecated' as command flag QCO_DEPRECATED.  I want to make feature
> flag 'unstable' visible there as well, so I can add policy for it.
> 
> To let me make it visible, add member @special_features (a bitset of
> QapiSpecialFeature) to QmpCommand, and adjust the generator to pass it
> through qmp_register_command().  Then replace "QCO_DEPRECATED in
> @flags" by QAPI_DEPRECATED in @special_features", and drop
> QCO_DEPRECATED.
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> Acked-by: John Snow <jsnow@redhat.com>
> ---

> +++ b/qapi/qmp-dispatch.c
> @@ -176,7 +176,7 @@ QDict *qmp_dispatch(const QmpCommandList *cmds, QObject *request,
>                    "The command %s has not been found", command);
>          goto out;
>      }
> -    if (cmd->options & QCO_DEPRECATED) {
> +    if (cmd->special_features & 1u << QAPI_DEPRECATED) {

I admit having to check the C operator precedence table when reading
this (<< is higher than &); if writing it myself, I would probably
have used explicit () to avoid reviewer confusion, but what you have
is correct.  (After grepping for ' & 1.*<<' and ' & (1.*<<', it looks
like authors using explicit precedence happens more often, but that
there are other instances in the code base relying on implicit
precedence.)

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


