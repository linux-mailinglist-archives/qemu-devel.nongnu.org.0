Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F4524CAA54
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 17:34:21 +0100 (CET)
Received: from localhost ([::1]:48860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPRvg-0002s5-P5
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 11:34:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nPRqh-0003nb-Vl
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 11:29:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25283)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nPRqg-00005f-8q
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 11:29:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646238549;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4JYBVP71dm6qwHu1wwd1S6iPhE9b42/h7o81Qtmexmg=;
 b=YX40hjXQQxCKpwxmYcSumGmf2tAocVIp+/c5FmiSv4UWOuLteu2kPCWnQS8pHZFPrRO+cX
 alNpmMPES3Sb7FW+bmT33i0EKjSVezEr0WCsXxXyMsMIETffdUM57N1TDvYKvJU3NfEitj
 sbku/SlfnJ/q0MM3MpjU1dh7ZdnH6uc=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-18-AAJiZd3BNrWU2rYRoAF6zA-1; Wed, 02 Mar 2022 11:29:08 -0500
X-MC-Unique: AAJiZd3BNrWU2rYRoAF6zA-1
Received: by mail-wm1-f69.google.com with SMTP id
 ay7-20020a05600c1e0700b003813d7a7d03so1009010wmb.1
 for <qemu-devel@nongnu.org>; Wed, 02 Mar 2022 08:29:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=4JYBVP71dm6qwHu1wwd1S6iPhE9b42/h7o81Qtmexmg=;
 b=j2rt/ZAJZPJb1/Uui4hiF6ieLG7ugVoeTdL/gtJqDz12pr/b97YwM68G1eiytjg4NF
 jfI71Iyvp7dTFq07eeR0nopziWzgGkm/TSg7an1BOaCx/vnN+Q0GhzK/ywmvLrZqWkq5
 XXysKNxfD04t28+B4J4O5e3VBkQDa7iFo3lt1JHNdNXEq+Mv59Nk5gxIrlOlFKwklSjn
 d0mqPv48yBkb1J0GW113q/VlNuvpEkKQFf8j1ek3WcqD5LEgjA2+jfTe06NUQ9j+iiP1
 8vr+T2tPUYGPBas6cZ/JwsKK0o80Zygjs2G4o/MKtNdbJmqU105qeMRHjq7Y2sKpMto8
 BLnw==
X-Gm-Message-State: AOAM532bss0VlvjWLDu6Q4BSpLRFsVgM5z244YLNWTVlLEQ1oWmA7/32
 /HrRCm+C0g4umg61p/IgXjx3ymGQsxW3wHWPa+67x28zO8wlli5eIyZTP1ScgPce3IdbbIezrrL
 oxzHKWXgaPavrMUQ=
X-Received: by 2002:a5d:56cd:0:b0:1ee:3248:525b with SMTP id
 m13-20020a5d56cd000000b001ee3248525bmr21677360wrw.124.1646238546613; 
 Wed, 02 Mar 2022 08:29:06 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwnuzpoqkxUXsedIQ3mO7DVJwgzjOmZC8iKKjQtEy+lCllqu+K+PPeU8AEGxPiyGzG6Giw9Sw==
X-Received: by 2002:a5d:56cd:0:b0:1ee:3248:525b with SMTP id
 m13-20020a5d56cd000000b001ee3248525bmr21677329wrw.124.1646238546364; 
 Wed, 02 Mar 2022 08:29:06 -0800 (PST)
Received: from redhat.com ([2a10:8006:355c:0:48d6:b937:2fb9:b7de])
 by smtp.gmail.com with ESMTPSA id
 m18-20020a5d56d2000000b001edc00dbeeasm16594955wrw.69.2022.03.02.08.29.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Mar 2022 08:29:05 -0800 (PST)
Date: Wed, 2 Mar 2022 11:29:02 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: Re: propagating vmgenid outward and upward
Message-ID: <20220302112258-mutt-send-email-mst@kernel.org>
References: <20220301121419-mutt-send-email-mst@kernel.org>
 <CAHmME9qieLUDVoPYZPo=N8NCL1T-RzQ4p7kCFv3PKFUkhWZPsw@mail.gmail.com>
 <20220302031738-mutt-send-email-mst@kernel.org>
 <CAHmME9pf-bjnZuweoLqoFEmPy1OK7ogEgGEAva1T8uVTufhCuw@mail.gmail.com>
 <20220302074503-mutt-send-email-mst@kernel.org>
 <Yh93UZMQSYCe2LQ7@zx2c4.com>
 <20220302092149-mutt-send-email-mst@kernel.org>
 <CAHmME9rf7hQP78kReP2diWNeX=obPem=f8R-dC7Wkpic2xmffg@mail.gmail.com>
 <20220302101602-mutt-send-email-mst@kernel.org>
 <Yh+PET49oHNpxn+H@zx2c4.com>
MIME-Version: 1.0
In-Reply-To: <Yh+PET49oHNpxn+H@zx2c4.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: "Brown, Len" <len.brown@intel.com>, linux-hyperv@vger.kernel.org,
 Colm MacCarthaigh <colmmacc@amazon.com>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 adrian@parity.io, KVM list <kvm@vger.kernel.org>, Jann Horn <jannh@google.com>,
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

On Wed, Mar 02, 2022 at 04:36:49PM +0100, Jason A. Donenfeld wrote:
> Hi Michael,
> 
> On Wed, Mar 02, 2022 at 10:20:25AM -0500, Michael S. Tsirkin wrote:
> > So writing some code:
> > 
> > 1:
> > 	put plaintext in a buffer
> > 	put a key in a buffer
> > 	put the nonce for that encryption in a buffer
> > 
> > 	if vm gen id != stored vm gen id
> > 		stored vm gen id = vm gen id
> > 		goto 1
> > 
> > I think this is race free, but I don't see why does it matter whether we
> > read gen id atomically or not.
> 
> Because that 16 byte read of vmgenid is not atomic. Let's say you read
> the first 8 bytes, and then the VM is forked. In the forked VM, the next
> 8 bytes are the same as last time, but the first 8 bytes, which you
> already read, have changed. In that case, your != becomes a ==, and the
> test fails.
> 
> This is one of those fundamental things of "unique ID" vs "generation
> counter word".
> 
> Anyway, per your request in your last email, I wrote some code for this,
> which may or may not be totally broken, and only works on 64-bit x86,
> which is really the best possible case in terms of performance. And even
> so, it's not great.
> 
> Jason
> 
> --------8<------------------------
> 
> diff --git a/drivers/net/wireguard/noise.c b/drivers/net/wireguard/noise.c
> index 720952b92e78..250b8973007d 100644
> --- a/drivers/net/wireguard/noise.c
> +++ b/drivers/net/wireguard/noise.c
> @@ -106,6 +106,7 @@ static struct noise_keypair *keypair_create(struct wg_peer *peer)
>  	keypair->entry.type = INDEX_HASHTABLE_KEYPAIR;
>  	keypair->entry.peer = peer;
>  	kref_init(&keypair->refcount);
> +	keypair->vmgenid = vmgenid_read_atomic();
>  	return keypair;
>  }
> 
> diff --git a/drivers/net/wireguard/noise.h b/drivers/net/wireguard/noise.h
> index c527253dba80..0add240a14a0 100644
> --- a/drivers/net/wireguard/noise.h
> +++ b/drivers/net/wireguard/noise.h
> @@ -27,10 +27,13 @@ struct noise_symmetric_key {
>  	bool is_valid;
>  };
> 
> +extern __uint128_t vmgenid_read_atomic(void);
> +
>  struct noise_keypair {
>  	struct index_hashtable_entry entry;
>  	struct noise_symmetric_key sending;
>  	atomic64_t sending_counter;
> +	__uint128_t vmgenid;
>  	struct noise_symmetric_key receiving;
>  	struct noise_replay_counter receiving_counter;
>  	__le32 remote_index;
> diff --git a/drivers/net/wireguard/send.c b/drivers/net/wireguard/send.c
> index 5368f7c35b4b..40d016be59e3 100644
> --- a/drivers/net/wireguard/send.c
> +++ b/drivers/net/wireguard/send.c
> @@ -381,6 +381,9 @@ void wg_packet_send_staged_packets(struct wg_peer *peer)
>  			goto out_invalid;
>  	}
> 
> +	if (keypair->vmgenid != vmgenid_read_atomic())
> +		goto out_invalid;
> +
>  	packets.prev->next = NULL;
>  	wg_peer_get(keypair->entry.peer);
>  	PACKET_CB(packets.next)->keypair = keypair;

I don't think we care about an atomic read here.  All data is in buffer
by this point, if it did not fork before that then we are ok, even
if it forks during the read.

We probably do need a memory barrier to make sure all writes complete
before the read of vmgenid, I'm not sure which kind - I think hypervisor
can be trusted to do a full CPU barrier on fork so probably just a
compiler barrier.

> diff --git a/drivers/virt/vmgenid.c b/drivers/virt/vmgenid.c
> index 0ae1a39f2e28..c122fae1d494 100644
> --- a/drivers/virt/vmgenid.c
> +++ b/drivers/virt/vmgenid.c
> @@ -21,6 +21,21 @@ struct vmgenid_state {
>  	u8 this_id[VMGENID_SIZE];
>  };
> 
> +static __uint128_t *val;
> +
> +__uint128_t vmgenid_read_atomic(void)
> +{
> +	__uint128_t ret = 0;
> +	if (!val)
> +		return 0;
> +	asm volatile("lock cmpxchg16b %1"
> +		     : "+A"(ret)
> +		     : "m"(*val), "b"(0), "c"(0)
> +		     : "cc");
> +	return ret;
> +}
> +EXPORT_SYMBOL(vmgenid_read_atomic);
> +
>  static int vmgenid_add(struct acpi_device *device)
>  {
>  	struct acpi_buffer parsed = { ACPI_ALLOCATE_BUFFER };
> @@ -50,6 +65,7 @@ static int vmgenid_add(struct acpi_device *device)
>  	phys_addr = (obj->package.elements[0].integer.value << 0) |
>  		    (obj->package.elements[1].integer.value << 32);
>  	state->next_id = devm_memremap(&device->dev, phys_addr, VMGENID_SIZE, MEMREMAP_WB);
> +	val = (__uint128_t *)state->next_id;
>  	if (IS_ERR(state->next_id)) {
>  		ret = PTR_ERR(state->next_id);
>  		goto out;


