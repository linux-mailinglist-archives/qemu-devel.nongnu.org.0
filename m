Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E02E7343638
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 02:29:43 +0100 (CET)
Received: from localhost ([::1]:46996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lO9O2-0002sW-Eu
	for lists+qemu-devel@lfdr.de; Sun, 21 Mar 2021 21:29:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lO9NG-0002R3-Qo
 for qemu-devel@nongnu.org; Sun, 21 Mar 2021 21:28:54 -0400
Received: from mail-yb1-xb34.google.com ([2607:f8b0:4864:20::b34]:41487)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lO9NF-0000Tl-6a
 for qemu-devel@nongnu.org; Sun, 21 Mar 2021 21:28:54 -0400
Received: by mail-yb1-xb34.google.com with SMTP id j2so4874084ybj.8
 for <qemu-devel@nongnu.org>; Sun, 21 Mar 2021 18:28:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=VMRcrfBGyDPnqRdN+keoKJWIeg4otCXrnSXK9Isljv0=;
 b=OVkl1n9jnM+ThibYjg29bLXsN1EQ0wLNCp7Z5k7GLukDqwHJ5RM6ulX5rk9l6UyppI
 3WrJroM1VMFWqu82KS6se3BiFIojF6DFW7Zt6QiJooiKsAFawnbZU30esT0mxK1UqNHk
 NC9LhoiFFf7wFDed95+sOx702TYipcMzjdlLke6aWwwDMeo7B+1uBcByb5tWYDbIHYTt
 5tLZycIZGZxNRsEKEa2wd54e5U0ZJg5QuLRa5hFS91q3Excw3Ics2eIcuUwNQWE1esYV
 rL8pLLQ6auIESDpGApJTTh6lfDc0uWn9rEsHv85NY0jvnzKCYKRLecT0CpLVz6gdozO3
 PaeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=VMRcrfBGyDPnqRdN+keoKJWIeg4otCXrnSXK9Isljv0=;
 b=R/Vj+ZbwzLX19NJaD9CoLeL5+ch9vlfZVoU933ZPSXW7h/rghIvxEvs+KL3M9RltY1
 EDyMTt2MRhllVEwlh4CoounB3EVDlfU1dARqkljLGe0kCM9Q8hfgoRzGZdp8jXrWlIhi
 XNbziGve97d6bLpUjRnbzKzU4HjhuebwaC0Ru8Ouwc0jBESyKTi9izrPVsAROTbx96xc
 rHZka/Dc5cRf1ngozvhMgB6F2HvxnBy6SjZH30KrSlLkDiJg34/hCeUzDB5IGlTpzL10
 DGwwBHTYFocoow+l4P0jVvHAdDFLa9Upf9H80+OC4vL/7SiILGv3OEC956I0iRQXIhDU
 /btg==
X-Gm-Message-State: AOAM530fNCh4Dg8n87E3Iqh1VZB5UUe9oIbDSs468pbHmbB4LaHWBfco
 sweMeqYkAngtTkbvW1tfcLbXcMY+FPxR6VwZqQ8=
X-Google-Smtp-Source: ABdhPJwTqhUj7tmeYvSkmpYqQnJHU/UfBMrpG7QUvHQ3iPSThjILHLKmZnQpYpEW2R7UQMXKnA/Nj3Ose5EcGIEyuKo=
X-Received: by 2002:a25:da08:: with SMTP id n8mr20997143ybf.314.1616376531631; 
 Sun, 21 Mar 2021 18:28:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210317062638.72626-1-bmeng.cn@gmail.com>
In-Reply-To: <20210317062638.72626-1-bmeng.cn@gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Mon, 22 Mar 2021 09:28:40 +0800
Message-ID: <CAEUhbmUye1GQGhTU3vrrBdn_i29J9EfABY6NCnu8=9YDwGK92w@mail.gmail.com>
Subject: Re: [PATCH v5 00/12] net: Pad short frames for network backends
To: Jason Wang <jasowang@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>, 
 Peter Maydell <peter.maydell@linaro.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b34;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb34.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Mar 17, 2021 at 2:26 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> The minimum Ethernet frame length is 60 bytes. For short frames with
> smaller length like ARP packets (only 42 bytes), on a real world NIC
> it can choose either padding its length to the minimum required 60
> bytes, or sending it out directly to the wire. Such behavior can be
> hardcoded or controled by a register bit. Similarly on the receive
> path, NICs can choose either dropping such short frames directly or
> handing them over to software to handle.
>
> On the other hand, for the network backends like SLiRP/TAP, they
> don't expose a way to control the short frame behavior. As of today
> they just send/receive data from/to the other end connected to them,
> which means any sized packet is acceptable. So they can send and
> receive short frames without any problem. It is observed that ARP
> packets sent from SLiRP/TAP are 42 bytes, and SLiRP/TAP just send
> these ARP packets to the other end which might be a NIC model that
> does not allow short frames to pass through.
>
> To provide better compatibility, for packets sent from QEMU network
> backends like SLiRP/TAP, we change to pad short frames before sending
> it out to the other end, if the other end does not forbid it via the
> nc->do_not_pad flag. This ensures a backend as an Ethernet sender
> does not violate the spec. But with this change, the behavior of
> dropping short frames from SLiRP/TAP interfaces in the NIC model
> cannot be emulated because it always receives a packet that is spec
> complaint. The capability of sending short frames from NIC models is
> still supported and short frames can still pass through SLiRP/TAP.
>
> This series should be able to fix the issue as reported with some
> NIC models before, that ARP requests get dropped, preventing the
> guest from becoming visible on the network. It was workarounded in
> these NIC models on the receive path, that when a short frame is
> received, it is padded up to 60 bytes.
>
> Changes in v5:
> - minor update on commit message
> - update the eth_pad_short_frame() comment
>

Ping?

