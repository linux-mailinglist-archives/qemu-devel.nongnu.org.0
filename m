Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 564462FBCCE
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 17:47:26 +0100 (CET)
Received: from localhost ([::1]:59738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1uA7-0000C1-W4
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 11:47:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1l1u4T-0004Da-QK
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 11:41:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:22190)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1l1u4Q-0000IW-Af
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 11:41:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611074489;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9KPwaQQpmMsmYRyLdPbtKthM/QC4Mz9L8hmI6zryRDg=;
 b=WajNOa463/m3i+PEcfgla+Dv0Bry6fam/xHiSG2HM4quK6LMTSL/OlybD5N4PHNMOZYtDL
 IZ5vdVWE2SZ123AGF1Y5sFAacv1CcUbTO2KR6cFuuTyxXSesVxJtAyhfjmVPOSYcJvPpHW
 kkeaecJERbqUCbkUzr/ZvlyQtHWO2Ag=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-180-65nhtF8XOty6ZiqU-OpVRQ-1; Tue, 19 Jan 2021 11:41:27 -0500
X-MC-Unique: 65nhtF8XOty6ZiqU-OpVRQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8ECB7801817;
 Tue, 19 Jan 2021 16:41:26 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-182.ams2.redhat.com
 [10.36.112.182])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 37E772CF2C;
 Tue, 19 Jan 2021 16:41:26 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 2A5C518003A1; Tue, 19 Jan 2021 17:41:21 +0100 (CET)
Date: Tue, 19 Jan 2021 17:41:21 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [RFC PATCH 0/2] hw/usb/dev-uas: Fix Clang 11
 -Wgnu-variable-sized-type-not-at-end error
Message-ID: <20210119164121.7kbyqjfgmutjtnj3@sirius.home.kraxel.org>
References: <20210118170308.282442-1-philmd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210118170308.282442-1-philmd@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.195,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jan 18, 2021 at 06:03:06PM +0100, Philippe Mathieu-Daudé wrote:
> Another attempt to fix the following Clang 11 warning:
> 
>   usb/dev-uas.c:157:31: error: field 'status' with variable sized type 'uas_i=
> u' not at the end of a struct or class is a GNU extension [-Werror,-Wgnu-vari=
> able-sized-type-not-at-end]
>       uas_iu                    status;
>                                 ^
> If a guest send a packet with additional data, respond
> with "Illegal Request - parameter not supported".

Why rfc?  looks good to me as-is ;)

thanks,
  Gerd


