Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48E78274308
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Sep 2020 15:29:59 +0200 (CEST)
Received: from localhost ([::1]:37370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kKiMo-00050f-DX
	for lists+qemu-devel@lfdr.de; Tue, 22 Sep 2020 09:29:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kKiIV-0001Lm-5P
 for qemu-devel@nongnu.org; Tue, 22 Sep 2020 09:25:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20856)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kKiIS-0007bf-Sx
 for qemu-devel@nongnu.org; Tue, 22 Sep 2020 09:25:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600781127;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UKOgY1lIe7oAEutTT1EzvlTaAsYOOc8kJvHosVrnKZM=;
 b=S/ZJQxBlc7u1ExtRi7OXbiQu8gAeUnLGfkbHDwbbIEpajqvh55dcG/6g3Rmial89RT4Rhe
 jV85zZsfYO/WkP/NPjBvZGZmXk4g+k84j4tUcKN1LBfIhBsJzrJaME+nzHwqD5413KDW3D
 aS9rBXMf2dOUxgTjI2NMSSrjiwORuBs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-117-mbww1_IINsmyG8ZXG6cSjA-1; Tue, 22 Sep 2020 09:25:26 -0400
X-MC-Unique: mbww1_IINsmyG8ZXG6cSjA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E00558030A1;
 Tue, 22 Sep 2020 13:25:24 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-66.ams2.redhat.com
 [10.36.114.66])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B1F7178810;
 Tue, 22 Sep 2020 13:25:24 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 47FB11132E9A; Tue, 22 Sep 2020 15:25:23 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH 0/1] block: future of sheepdog storage driver ?
References: <20200922090147.1993705-1-berrange@redhat.com>
 <0073f0f8-2a59-9bad-3088-4790ec07fe31@redhat.com>
Date: Tue, 22 Sep 2020 15:25:23 +0200
In-Reply-To: <0073f0f8-2a59-9bad-3088-4790ec07fe31@redhat.com> (Thomas Huth's
 message of "Tue, 22 Sep 2020 12:32:37 +0200")
Message-ID: <87d02eose4.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/22 00:31:51
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.455,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Liu Yuan <namei.unix@gmail.com>, sheepdog@lists.wpkg.org,
 "Daniel P. =?utf-8?Q?Berrang=C3=A9?=" <berrange@redhat.com>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Thomas Huth <thuth@redhat.com> writes:

> On 22/09/2020 11.01, Daniel P. Berrang=C3=A9 wrote:
> [...]
>> Does someone have a compelling reason for QEMU to keep supporting
>> this driver, other than the fact that it already exists ?
>>=20
>> If not, it looks like a candidate for deprecating in QEMU with a
>> view to later removing it.
>
> I think you gave enough examples why this is a good candidate for
> deprecation. So I'd say: Simply send a patch to deprecate it. That's
> what's our deprecation process is good for. If someone still cares for
> sheepdog, they then can speak up and we can revert the patch that put it
> on the deprecation list.

Concur.


