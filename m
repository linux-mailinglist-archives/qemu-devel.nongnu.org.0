Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2654F4CA940
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 16:38:18 +0100 (CET)
Received: from localhost ([::1]:47738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPR3Q-000183-NW
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 10:38:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=fxzG=TN=zx2c4.com=Jason@kernel.org>)
 id 1nPR2I-0000RJ-Fb
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 10:37:06 -0500
Received: from ams.source.kernel.org ([145.40.68.75]:34450)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=fxzG=TN=zx2c4.com=Jason@kernel.org>)
 id 1nPR2F-0006HH-7Z
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 10:37:06 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 8D4ABB8202F;
 Wed,  2 Mar 2022 15:36:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F356EC004E1;
 Wed,  2 Mar 2022 15:36:55 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="GyXBDhfe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1646235414;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qgwnhxDwnLmzAxzxcKcHyP9gfTHebPzmcbpz3qXzc7E=;
 b=GyXBDhfeqkL3rUcgcoF7HG564CnCVx7NVXoMWxWpeiOyNtR1HJ8TX9Zi1HITpULTsKjAqa
 GThOfXyO0UxUwzypSPXxcFyR1tLXxNs3wqSZiQC46q4UcoOdTkqbg63dPxUMytEXzw+STE
 84rLX/aQ4SLETfFdv1vTE51PHJTXu6M=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 3b70f4fb
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO); 
 Wed, 2 Mar 2022 15:36:54 +0000 (UTC)
Date: Wed, 2 Mar 2022 16:36:49 +0100
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: propagating vmgenid outward and upward
Message-ID: <Yh+PET49oHNpxn+H@zx2c4.com>
References: <Yh5JwK6toc/zBNL7@zx2c4.com>
 <20220301121419-mutt-send-email-mst@kernel.org>
 <CAHmME9qieLUDVoPYZPo=N8NCL1T-RzQ4p7kCFv3PKFUkhWZPsw@mail.gmail.com>
 <20220302031738-mutt-send-email-mst@kernel.org>
 <CAHmME9pf-bjnZuweoLqoFEmPy1OK7ogEgGEAva1T8uVTufhCuw@mail.gmail.com>
 <20220302074503-mutt-send-email-mst@kernel.org>
 <Yh93UZMQSYCe2LQ7@zx2c4.com>
 <20220302092149-mutt-send-email-mst@kernel.org>
 <CAHmME9rf7hQP78kReP2diWNeX=obPem=f8R-dC7Wkpic2xmffg@mail.gmail.com>
 <20220302101602-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220302101602-mutt-send-email-mst@kernel.org>
Received-SPF: pass client-ip=145.40.68.75;
 envelope-from=SRS0=fxzG=TN=zx2c4.com=Jason@kernel.org;
 helo=ams.source.kernel.org
X-Spam_score_int: -67
X-Spam_score: -6.8
X-Spam_bar: ------
X-Spam_report: (-6.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: "Brown, Len" <len.brown@intel.com>, linux-hyperv@vger.kernel.org,
 Colm MacCarthaigh <colmmacc@amazon.com>,
 Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>, adrian@parity.io,
 KVM list <kvm@vger.kernel.org>, Jann Horn <jannh@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linux PM <linux-pm@vger.kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 Dominik Brodowski <linux@dominikbrodowski.net>,
 QEMU Developers <qemu-devel@nongnu.org>, Alexander Graf <graf@amazon.com>,
 Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
 Pavel Machek <pavel@ucw.cz>, Theodore Ts'o <tytso@mit.edu>,
 "Michael Kelley \(LINUX\)" <mikelley@microsoft.com>,
 Laszlo Ersek <lersek@redhat.com>, Arnd Bergmann <arnd@arndb.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Michael,

On Wed, Mar 02, 2022 at 10:20:25AM -0500, Michael S. Tsirkin wrote:
> So writing some code:
> 
> 1:
> 	put plaintext in a buffer
> 	put a key in a buffer
> 	put the nonce for that encryption in a buffer
> 
> 	if vm gen id != stored vm gen id
> 		stored vm gen id = vm gen id
> 		goto 1
> 
> I think this is race free, but I don't see why does it matter whether we
> read gen id atomically or not.

Because that 16 byte read of vmgenid is not atomic. Let's say you read
the first 8 bytes, and then the VM is forked. In the forked VM, the next
8 bytes are the same as last time, but the first 8 bytes, which you
already read, have changed. In that case, your != becomes a ==, and the
test fails.

This is one of those fundamental things of "unique ID" vs "generation
counter word".

Anyway, per your request in your last email, I wrote some code for this,
which may or may not be totally broken, and only works on 64-bit x86,
which is really the best possible case in terms of performance. And even
so, it's not great.

Jason

--------8<------------------------

diff --git a/drivers/net/wireguard/noise.c b/drivers/net/wireguard/noise.c
index 720952b92e78..250b8973007d 100644
--- a/drivers/net/wireguard/noise.c
+++ b/drivers/net/wireguard/noise.c
@@ -106,6 +106,7 @@ static struct noise_keypair *keypair_create(struct wg_peer *peer)
 	keypair->entry.type = INDEX_HASHTABLE_KEYPAIR;
 	keypair->entry.peer = peer;
 	kref_init(&keypair->refcount);
+	keypair->vmgenid = vmgenid_read_atomic();
 	return keypair;
 }

diff --git a/drivers/net/wireguard/noise.h b/drivers/net/wireguard/noise.h
index c527253dba80..0add240a14a0 100644
--- a/drivers/net/wireguard/noise.h
+++ b/drivers/net/wireguard/noise.h
@@ -27,10 +27,13 @@ struct noise_symmetric_key {
 	bool is_valid;
 };

+extern __uint128_t vmgenid_read_atomic(void);
+
 struct noise_keypair {
 	struct index_hashtable_entry entry;
 	struct noise_symmetric_key sending;
 	atomic64_t sending_counter;
+	__uint128_t vmgenid;
 	struct noise_symmetric_key receiving;
 	struct noise_replay_counter receiving_counter;
 	__le32 remote_index;
diff --git a/drivers/net/wireguard/send.c b/drivers/net/wireguard/send.c
index 5368f7c35b4b..40d016be59e3 100644
--- a/drivers/net/wireguard/send.c
+++ b/drivers/net/wireguard/send.c
@@ -381,6 +381,9 @@ void wg_packet_send_staged_packets(struct wg_peer *peer)
 			goto out_invalid;
 	}

+	if (keypair->vmgenid != vmgenid_read_atomic())
+		goto out_invalid;
+
 	packets.prev->next = NULL;
 	wg_peer_get(keypair->entry.peer);
 	PACKET_CB(packets.next)->keypair = keypair;
diff --git a/drivers/virt/vmgenid.c b/drivers/virt/vmgenid.c
index 0ae1a39f2e28..c122fae1d494 100644
--- a/drivers/virt/vmgenid.c
+++ b/drivers/virt/vmgenid.c
@@ -21,6 +21,21 @@ struct vmgenid_state {
 	u8 this_id[VMGENID_SIZE];
 };

+static __uint128_t *val;
+
+__uint128_t vmgenid_read_atomic(void)
+{
+	__uint128_t ret = 0;
+	if (!val)
+		return 0;
+	asm volatile("lock cmpxchg16b %1"
+		     : "+A"(ret)
+		     : "m"(*val), "b"(0), "c"(0)
+		     : "cc");
+	return ret;
+}
+EXPORT_SYMBOL(vmgenid_read_atomic);
+
 static int vmgenid_add(struct acpi_device *device)
 {
 	struct acpi_buffer parsed = { ACPI_ALLOCATE_BUFFER };
@@ -50,6 +65,7 @@ static int vmgenid_add(struct acpi_device *device)
 	phys_addr = (obj->package.elements[0].integer.value << 0) |
 		    (obj->package.elements[1].integer.value << 32);
 	state->next_id = devm_memremap(&device->dev, phys_addr, VMGENID_SIZE, MEMREMAP_WB);
+	val = (__uint128_t *)state->next_id;
 	if (IS_ERR(state->next_id)) {
 		ret = PTR_ERR(state->next_id);
 		goto out;


