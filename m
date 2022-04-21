Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F091F50A21E
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 16:23:44 +0200 (CEST)
Received: from localhost ([::1]:44384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhXii-0000br-3b
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 10:23:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nhXHI-0004rS-Iw
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 09:55:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:50944)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nhXHF-0006yg-PZ
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 09:55:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650549320;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=m8ZG2BJVI2/Q4YYkjQxWNe5QOrB+FvuPjG1L1cJGgGg=;
 b=iMi2Wha5Wnpke0mStVdNS4vLnfdiZ5KALUrnKhax0EoW/1RXxOuU38U42DCrXRwmmdQV8H
 tLhleWjyo9jXd6mFt6h8h/GIVKTNNcRb2G9/CTQHYvyzD0Wz60igIPW6DCnPR4d0DwcSpN
 +GT5aYdGWqhzSrboyRQXGYH+JrbrOCE=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-39-yam0gZ4HPS67kvphwbqVjw-1; Thu, 21 Apr 2022 09:55:16 -0400
X-MC-Unique: yam0gZ4HPS67kvphwbqVjw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 272A22805340;
 Thu, 21 Apr 2022 13:55:11 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F2C3740CFD22;
 Thu, 21 Apr 2022 13:55:10 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id B86B021E6A1F; Thu, 21 Apr 2022 15:55:09 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Kshitij Suri <kshitij.suri@nutanix.com>
Subject: Re: [PATCH v5 2/2] Added parameter to take screenshot with
 screendump as PNG
References: <20220408071336.99839-1-kshitij.suri@nutanix.com>
 <20220408071336.99839-3-kshitij.suri@nutanix.com>
Date: Thu, 21 Apr 2022 15:55:09 +0200
In-Reply-To: <20220408071336.99839-3-kshitij.suri@nutanix.com> (Kshitij Suri's
 message of "Fri, 8 Apr 2022 07:13:35 +0000")
Message-ID: <87y1zysfr6.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: soham.ghosh@nutanix.com, peter.maydell@linaro.org, thuth@redhat.com,
 berrange@redhat.com, prerna.saxena@nutanix.com, qemu-devel@nongnu.org,
 dgilbert@redhat.com, philippe.mathieu.daude@gmail.com, kraxel@redhat.com,
 pbonzini@redhat.com, prachatos.mitra@nutanix.com, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Kshitij Suri <kshitij.suri@nutanix.com> writes:

> Currently screendump only supports PPM format, which is un-compressed. Ad=
ded
> a "format" parameter to QMP and HMP screendump command to support PNG ima=
ge
> capture using libpng.
>
> QMP example usage:
> { "execute": "screendump", "arguments": { "filename": "/tmp/image",
> "format":"png" } }
>
> HMP example usage:
> screendump /tmp/image -f png
>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/718
>
> Signed-off-by: Kshitij Suri <kshitij.suri@nutanix.com>
>
> Reviewed-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>

QAPI schema
Acked-by: Markus Armbruster <armbru@redhat.com>


