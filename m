Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D57E5EC4DC
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 15:46:55 +0200 (CEST)
Received: from localhost ([::1]:51450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odAvG-0003vz-57
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 09:46:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1od9DP-0003kj-MB
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 07:57:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:45149)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1od9DN-0007BT-PF
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 07:57:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664279846;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0QhmsVLXO2AHE436gB0OgdQpWUcfMhiYsyldy3FGGt4=;
 b=JxH2GCa7eJx19Jy2uio7wZJ8csD9v4Lz9kWf12FSY+mHoPJaguroZRpYp2gI5e2PI/BMqD
 lSf5oxVaDVEwroqTbBGDMtqWxiq/VMAdj3FI5uChI03EXjouwOqOeOoPkILmddnBib3lzR
 6ryP1Dlrk/l3eOrCCoPteBHXS9XoYP0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-591-qzpXSty3MXKHM3rGGElKHA-1; Tue, 27 Sep 2022 07:57:23 -0400
X-MC-Unique: qzpXSty3MXKHM3rGGElKHA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DFECE8027ED;
 Tue, 27 Sep 2022 11:57:22 +0000 (UTC)
Received: from redhat.com (unknown [10.39.192.158])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D50E5C15BA5;
 Tue, 27 Sep 2022 11:57:20 +0000 (UTC)
Date: Tue, 27 Sep 2022 13:57:19 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel@nongnu.org, dinechin@redhat.com,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [PATCH v6 3/5] module: add Error arguments to module_load and
 module_load_qom
Message-ID: <YzLlHwpx2syQLPFE@redhat.com>
References: <20220923232104.28420-1-cfontana@suse.de>
 <20220923232104.28420-4-cfontana@suse.de>
 <YzGBOwBQucv1F2NL@redhat.com>
 <3dc4a54e-7d04-36db-0931-2fb8d068b5f2@suse.de>
 <87a66lmev9.fsf@pond.sub.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87a66lmev9.fsf@pond.sub.org>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 27.09.2022 um 09:54 hat Markus Armbruster geschrieben:
> Potential issue before this patch: I can't see bdrv_open_child() being
> undone.  Shouldn't we close bs->file?  And what about
> bdrv_open_child()'s side effect on @options?

bs->file is handled by the caller, bdrv_open_driver().

options is going to be freed anyway, so I don't think we care about its
content. And anyway, doesn't bdrv_open_child() only remove those entries
from it that it processed, like in the success case?

Kevin


