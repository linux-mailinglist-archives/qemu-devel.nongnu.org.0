Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D1FB4E3BF7
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Mar 2022 10:54:06 +0100 (CET)
Received: from localhost ([::1]:36750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWbDJ-0007oQ-93
	for lists+qemu-devel@lfdr.de; Tue, 22 Mar 2022 05:54:05 -0400
Received: from eggs.gnu.org ([209.51.188.92]:51268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nWb8R-0000n0-EA
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 05:49:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45664)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nWb8O-0002De-To
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 05:49:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647942532;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Hm/hq4W/fR+NHY2FeX4pcR79V3Wcko1SjjheMvvoa8c=;
 b=X20VeY5p4T71YICO5l14mUPuWfxEB6m2yL1lIOrOejUVv87P3ws8hBugJdwvYId0wbpzuI
 GTSnG7MRtSg4fwCytxfrccJoe3XIPLfZIpzgX6RGszoXFUi2Tx63EaAmm6A9zAXsTL57Qv
 l1C0ltEnAuPPnYJcpbnsozrfjpwOEik=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-160-4evcTyJkObSR0umdqgj-Cw-1; Tue, 22 Mar 2022 05:48:48 -0400
X-MC-Unique: 4evcTyJkObSR0umdqgj-Cw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4F22F180074F;
 Tue, 22 Mar 2022 09:48:48 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2E0BB401E5A;
 Tue, 22 Mar 2022 09:48:48 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 2E34821E6742; Tue, 22 Mar 2022 10:48:47 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 1/3] qapi-schema: support alternates with array type
References: <20220321164243.200569-1-pbonzini@redhat.com>
 <20220321164243.200569-2-pbonzini@redhat.com>
Date: Tue, 22 Mar 2022 10:48:47 +0100
In-Reply-To: <20220321164243.200569-2-pbonzini@redhat.com> (Paolo Bonzini's
 message of "Mon, 21 Mar 2022 17:42:41 +0100")
Message-ID: <874k3qjp1c.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Paolo Bonzini <pbonzini@redhat.com> writes:

> Detect array types as alternate branches, and turn the JSON list into
> a QAPISchemaArrayType.  Array types in an alternate are represented with
> QTYPE_QLIST in the type field.
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

I double-checked the generated code; it looks good to me.

Thanks for implementing this, and extra thanks for the tests!

Reviewed-by: Markus Armbruster <armbru@redhat.com>


