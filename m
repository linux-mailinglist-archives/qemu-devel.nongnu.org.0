Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA8953ED405
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Aug 2021 14:36:00 +0200 (CEST)
Received: from localhost ([::1]:38900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFbqR-0003qW-Qz
	for lists+qemu-devel@lfdr.de; Mon, 16 Aug 2021 08:35:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jziviani@suse.de>) id 1mFbos-00035B-Tp
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 08:34:22 -0400
Received: from smtp-out1.suse.de ([195.135.220.28]:44842)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jziviani@suse.de>) id 1mFbor-0008Rm-Fo
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 08:34:22 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id C2DA921E57;
 Mon, 16 Aug 2021 12:34:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1629117258; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wr7gW8ch6IdlMgPQEe9x3OeMpE4O3mf1a6ki5gR/IkM=;
 b=KGpQUqeWSnUqtOMleqehinpM78fRT+F53NzlBq9ElDospDhuf/HygCo6E7suyv0xa/EH12
 3dCRV8tZ/pLyRaBYL2ywEluR++LVAh5lXyCc15HBVVGZ70iHvmKfaMIOfeKVSapoIhK2vt
 mze2Z+MIOnmCjABMyQG15uEcmSCClPA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1629117258;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wr7gW8ch6IdlMgPQEe9x3OeMpE4O3mf1a6ki5gR/IkM=;
 b=Bj5/XBiQOJ7fwGyW788vxcb4Crb3M/4H5+Lz1MvUMveC417pGi4xRbq9Wvv7IRUCCT3D1P
 BFXGuVsXIdO/JVDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id CF8CC13B0A;
 Mon, 16 Aug 2021 12:34:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id LjkSJUlbGmGLegAAMHmgww
 (envelope-from <jziviani@suse.de>); Mon, 16 Aug 2021 12:34:17 +0000
Subject: Re: [PATCH] vga: don't abort when adding a duplicate isa-vga device
To: Gerd Hoffmann <kraxel@redhat.com>, Thomas Huth <thuth@redhat.com>
References: <20210813233619.32178-1-jziviani@suse.de>
 <9dd25d6d-b9ba-0000-96a0-451fd1b28c56@redhat.com>
 <20210816050555.k63uuhqhbloarcj2@sirius.home.kraxel.org>
From: Jose Ricardo Ziviani <jziviani@suse.de>
Message-ID: <89988201-e41c-89df-686e-243c34cc7d0f@suse.de>
Date: Mon, 16 Aug 2021 09:34:11 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210816050555.k63uuhqhbloarcj2@sirius.home.kraxel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=195.135.220.28; envelope-from=jziviani@suse.de;
 helo=smtp-out1.suse.de
X-Spam_score_int: -80
X-Spam_score: -8.1
X-Spam_bar: --------
X-Spam_report: (-8.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.71,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello Thomas and Gerd,

Thank you for reviewing it. Sending a v2 soon.

Thank you very much!

On 16/08/2021 02:05, Gerd Hoffmann wrote:
>    Hi,
>
>>> +    if (qemu_ram_block_by_name("vga.vram")) {
>>> +        error_report("vga.vram is already registered, ignoring this device");
>>> +        return;
>>> +    }
>> I think we should not ignore the error, but rather turn this into a proper
>> error (instead of aborting).
> Yes.  Silently fixing up things automatically tends to be worse long-term.
>
> take care,
>    Gerd
>

