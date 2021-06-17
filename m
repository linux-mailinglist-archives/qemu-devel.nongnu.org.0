Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32B6B3AB150
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 12:27:50 +0200 (CEST)
Received: from localhost ([::1]:44162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltpFV-0004YJ-7o
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 06:27:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1ltovT-0002Wq-O6
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 06:07:07 -0400
Received: from smtp-out1.suse.de ([195.135.220.28]:36826)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1ltovR-0006Ra-Vi
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 06:07:07 -0400
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id A758421B02;
 Thu, 17 Jun 2021 10:07:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1623924424; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+H9wrLTUYTZ9Zi5MQJfgaVHmVgh36zckt4yHu09ni7Y=;
 b=eJLWzGh7+UewQruB8pEY6SGCCtZ4UsnKcMKFpramXVjVkxLOzgmlgpx8UBVPGmu8wPzmVj
 0Gbzq9e1IfQ6fx1A9Aq6bXyD5+KDxt2IItyUIziQEYfQoaA87hZhZWHA2zDxlc/YxQS0f6
 Pxrs/zD8L7rkqRyq9QiRWMNTcq6RXrw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1623924424;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+H9wrLTUYTZ9Zi5MQJfgaVHmVgh36zckt4yHu09ni7Y=;
 b=u0F9zRdAnsHoRPl/2rZxyNJhB7NK7Ou4WqBghwJ+nD/wF8dFI5wTeFMLaNtpofN7W5UNJh
 3BLV0uufdf2kTgDQ==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 5B0FF118DD;
 Thu, 17 Jun 2021 10:07:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1623924424; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+H9wrLTUYTZ9Zi5MQJfgaVHmVgh36zckt4yHu09ni7Y=;
 b=eJLWzGh7+UewQruB8pEY6SGCCtZ4UsnKcMKFpramXVjVkxLOzgmlgpx8UBVPGmu8wPzmVj
 0Gbzq9e1IfQ6fx1A9Aq6bXyD5+KDxt2IItyUIziQEYfQoaA87hZhZWHA2zDxlc/YxQS0f6
 Pxrs/zD8L7rkqRyq9QiRWMNTcq6RXrw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1623924424;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+H9wrLTUYTZ9Zi5MQJfgaVHmVgh36zckt4yHu09ni7Y=;
 b=u0F9zRdAnsHoRPl/2rZxyNJhB7NK7Ou4WqBghwJ+nD/wF8dFI5wTeFMLaNtpofN7W5UNJh
 3BLV0uufdf2kTgDQ==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id Bx4MFMgey2CuWQAALh3uQQ
 (envelope-from <cfontana@suse.de>); Thu, 17 Jun 2021 10:07:04 +0000
Subject: Re: [PATCH 0/4] modules: add support for target-specific modules.
To: Gerd Hoffmann <kraxel@redhat.com>
References: <20210610101553.943689-1-kraxel@redhat.com>
 <5953598.eXybCX72BP@pizza>
 <20210615050930.bmgup2axfr7sqvoa@sirius.home.kraxel.org>
 <2963309.4TrVdrBa0x@pizza>
 <20210616092815.rjznyjnvgrrfojq6@sirius.home.kraxel.org>
 <bdf9b356-87ee-0749-c977-f48989fa8e26@suse.de>
 <20210617053759.uibvdpu2wtq3fqwv@sirius.home.kraxel.org>
 <2be72be7-5c3f-e25d-fb84-cf58b573bf27@suse.de>
 <20210617094811.gatatv7vla2rxqgc@sirius.home.kraxel.org>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <bd58cce3-d1c9-e22a-6653-34022a382796@suse.de>
Date: Thu, 17 Jun 2021 12:07:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20210617094811.gatatv7vla2rxqgc@sirius.home.kraxel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=195.135.220.28; envelope-from=cfontana@suse.de;
 helo=smtp-out1.suse.de
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.17,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
Cc: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, Greg Kurz <groug@kaod.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Jos=c3=a9_Ricardo_Ziviani?= <jose.ziviani@suse.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/17/21 11:48 AM, Gerd Hoffmann wrote:
>   Hi,
> 
>> Do we need to be able to unload modules that we previously loaded? Or is this not a realistic requirement?
> 
> Surely doable, but it's work and needs infrastructure we don't have
> right now.  We must be able to unregister everything modules can
> register, which is only partly the case today.  We need usage counters
> so we can figure whenever a module is in use or not.  Maybe more.
> 
> I don't see a use case justifying that work.

If unloading a QEMU module is indeed not a requirement for QEMU itself, or frameworks which use it,
do we see optimization opportunities as a consequence?

> 
> The linux kernel can unload modules (when enabled at build time), and
> pretty much the only reason I've ever used that is device driver
> development: test new driver version without reboot (as long as you
> don't make a mistake which Oopses the kernel ...).
> 
> take care,
>   Gerd
> 

Ciao,

Claudio

