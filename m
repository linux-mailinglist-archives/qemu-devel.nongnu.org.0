Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 776191F8D5E
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Jun 2020 07:44:41 +0200 (CEST)
Received: from localhost ([::1]:49550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jkhvE-0005Iz-IL
	for lists+qemu-devel@lfdr.de; Mon, 15 Jun 2020 01:44:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1jkhu7-0004Tv-FW
 for qemu-devel@nongnu.org; Mon, 15 Jun 2020 01:43:32 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:24129
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1jkhu5-0004Qh-8b
 for qemu-devel@nongnu.org; Mon, 15 Jun 2020 01:43:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592199807;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ElOugUULFNLubhyh0LeMvfcGTLq/H7Y3s9OyXO6dn/k=;
 b=KhFeuqCZ++y+kBpvdTqgfoclvvo7+sSqpiFrWa/W7hynRh3dFHc6KJU9NwVCpp+6jh/V35
 lUsUM6SrOtilnZMcPad/3VW0DkQPD++Na2gc5/my+ClhY6JdGMUnfUEkaDwtx0losC0HPK
 X3jVw9JsFFYV3aPVt7uaC1AAV80n+8Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-381-ueZtXveXPI61TSdBbrnX1A-1; Mon, 15 Jun 2020 01:43:25 -0400
X-MC-Unique: ueZtXveXPI61TSdBbrnX1A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4C295800053
 for <qemu-devel@nongnu.org>; Mon, 15 Jun 2020 05:43:24 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-112-132.ams2.redhat.com
 [10.36.112.132])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 348FE5C1B2;
 Mon, 15 Jun 2020 05:43:20 +0000 (UTC)
Subject: Re: [PATCH v8 1/5] hw/nvram/fw_cfg: Add the FW_CFG_DATA_GENERATOR
 interface
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org
References: <20200609170727.9977-1-philmd@redhat.com>
 <20200609170727.9977-2-philmd@redhat.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <d737209f-bb8e-ada2-f899-8b26ad9f7df2@redhat.com>
Date: Mon, 15 Jun 2020 07:43:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Firefox/52.0 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20200609170727.9977-2-philmd@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=lersek@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/15 01:43:27
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 "=?UTF-8?Q?Daniel_P._Berrang=c3=a9?=" <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 06/09/20 19:07, Philippe Mathieu-Daudé wrote:
> The FW_CFG_DATA_GENERATOR allows any object to produce
> blob of data consumable by the fw_cfg device.
> 
> Reviewed-by: Laszlo Ersek <lersek@redhat.com>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
> v8: addressed Laszlo's comments
> - fixed copy/paste typos
> - corrected fmt arguments order
> - do not call fw_cfg_add_file() if get_length() returned 0
> ---
>  docs/specs/fw_cfg.txt     |  9 ++++++-
>  include/hw/nvram/fw_cfg.h | 52 +++++++++++++++++++++++++++++++++++++++
>  hw/nvram/fw_cfg.c         | 36 +++++++++++++++++++++++++++
>  3 files changed, 96 insertions(+), 1 deletion(-)

looks good, thanks!


