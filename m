Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C9794DB01A
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Mar 2022 13:51:40 +0100 (CET)
Received: from localhost ([::1]:59612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUT7r-0004Gh-2z
	for lists+qemu-devel@lfdr.de; Wed, 16 Mar 2022 08:51:39 -0400
Received: from eggs.gnu.org ([209.51.188.92]:55960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nUSpt-0001DG-T7
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 08:33:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31973)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nUSpr-0002ir-HY
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 08:33:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647433982;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=R3vr5j+EAh4qOCJ7yTQcizgQz+Mae0Nsn4vAolhR+lE=;
 b=XAh7xcFkTYGmPATQ+DoPxYD27ZITjpvUrT7Q1ZprHKmbcabfG5GQYKCZrTVHEfNZjFhDy8
 0oy0Q6w6/AEQ4S0SC8rw4I44kQhMoazqGM1DFLeyXUnQOzZsbamxkcwV/7SwtPn8TzRzE2
 USQewBBOwtYcZ0rWitoXUQWJu3BRDfw=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-306-RWGOhv8sM-a70STsk5gfBA-1; Wed, 16 Mar 2022 08:33:01 -0400
X-MC-Unique: RWGOhv8sM-a70STsk5gfBA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 372DA1C05EBC
 for <qemu-devel@nongnu.org>; Wed, 16 Mar 2022 12:33:01 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 11D09566B09;
 Wed, 16 Mar 2022 12:33:01 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id F000D21E6821; Wed, 16 Mar 2022 13:32:59 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: marcandre.lureau@redhat.com
Subject: Re: [PATCH 26/27] tests: replace free_all() usage with g_auto
References: <20220316095459.2613885-1-marcandre.lureau@redhat.com>
Date: Wed, 16 Mar 2022 13:32:59 +0100
In-Reply-To: <20220316095459.2613885-1-marcandre.lureau@redhat.com> (marcandre
 lureau's message of "Wed, 16 Mar 2022 13:54:59 +0400")
Message-ID: <877d8u5b7o.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

marcandre.lureau@redhat.com writes:

> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> Use more idiomatic glib/auto-style code.
>
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

This is a bit of an improvement, but by its own, it's a rather weak
justification for the previous patch.  Do you have more uses of
g_autoptr in the pipe?


