Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02C0A68146D
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 16:13:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMVqK-0000wK-0g; Mon, 30 Jan 2023 10:13:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pMVqH-0000vb-Fg
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 10:13:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pMVqF-0004JJ-QA
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 10:13:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675091586;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=d6MmdXfOYouBoHJbeuzo77bR07RxlX7uOzLqAwrpyI8=;
 b=fEB/maWB9ijAfQZX0AmRexj1hMkt/galnIGxflPB/0RGumCVJcz/aMi6gOP/hUFl3ib5xW
 1B19lad0LMTcs5d9ATDcS5w8xRVLUBg7yEWBmNYcoSO9GwAmzO9b/VOzxTtrUV+KmpTGGP
 sS5qaOd8GTbJEBeng6JP0hErZAR059o=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-151-y5RV9GmnPli8CEBcdgpvlg-1; Mon, 30 Jan 2023 10:13:05 -0500
X-MC-Unique: y5RV9GmnPli8CEBcdgpvlg-1
Received: by mail-ej1-f69.google.com with SMTP id
 gz8-20020a170907a04800b0087bd94a505fso5178278ejc.16
 for <qemu-devel@nongnu.org>; Mon, 30 Jan 2023 07:13:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=d6MmdXfOYouBoHJbeuzo77bR07RxlX7uOzLqAwrpyI8=;
 b=1qPLTm+9sxpkrCvan32OZ/23z7m3aCJudUu56oGpMeKTgQg4/eilODrB1jDmdg+6fr
 Fmheq+Z2VNdjac6Jwo7N88MUJiro+wgvLjHiXynEs8ISX4lc/HervLckzZLldIJIVm5y
 o6/vkSb1NpVETd3gMQE7dXxjPb4s4aLAan9v93dLFF7Jt09Wn6btaQtY6bCl2/6+iJvU
 K6BlvgA7f/pjTd4hmsUiWZzQyohBRtmNPdFjcqKun6OKrz26SPpO6folgySIyaZHa9vm
 iHWqhcAahr/3q3pCubIa4vtV+8FoTlo8NJtBdtubI1PxPXaqrTnN+NmjMfDuIoKcnkK7
 8otQ==
X-Gm-Message-State: AO0yUKVV/zhaoFBq+UM/YcaivWhEhKNwSN5lRHZhvVahr2Kf/ObS+s3d
 ViiruzfpSmXaPhjR6TMQYLtO5oPs7/5C4QU7kb6HgR2+Wg9nNK9pim0xcGgQLQBqNRdkidGcILm
 haYz14alb2JXLQMU=
X-Received: by 2002:a17:906:2806:b0:879:2a5:dc3c with SMTP id
 r6-20020a170906280600b0087902a5dc3cmr13149056ejc.40.1675091583615; 
 Mon, 30 Jan 2023 07:13:03 -0800 (PST)
X-Google-Smtp-Source: AK7set8EyeBImv1siaNFC+m3NU894LqzBTrwwmnw2MCaE4p04weQlTSl813ywmcXQEtjggpjFqyaPg==
X-Received: by 2002:a17:906:2806:b0:879:2a5:dc3c with SMTP id
 r6-20020a170906280600b0087902a5dc3cmr13149027ejc.40.1675091583314; 
 Mon, 30 Jan 2023 07:13:03 -0800 (PST)
Received: from redhat.com ([2.52.144.173]) by smtp.gmail.com with ESMTPSA id
 ce4-20020a170906b24400b0078d3f96d293sm7008754ejb.30.2023.01.30.07.13.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Jan 2023 07:13:02 -0800 (PST)
Date: Mon, 30 Jan 2023 10:12:58 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org, Yan Vugenfirer <yvugenfi@redhat.com>,
 Yuri Benditovich <yuri.benditovich@daynix.com>,
 Sriram Yagnaraman <sriram.yagnaraman@est.tech>,
 Alexander Bulekov <alxndr@bu.edu>
Subject: Re: [PATCH v4 20/28] net: Strip virtio-net header when dumping
Message-ID: <20230130101211-mutt-send-email-mst@kernel.org>
References: <20230130134715.76604-1-akihiko.odaki@daynix.com>
 <20230130134715.76604-21-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230130134715.76604-21-akihiko.odaki@daynix.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, Jan 30, 2023 at 10:47:07PM +0900, Akihiko Odaki wrote:
> filter-dump specifiees Ethernet as PCAP LinkType, which does not expect
> virtio-net header. Having virtio-net header in such PCAP file breaks
> PCAP unconsumable. Unfortunately currently there is no LinkType for
> virtio-net so for now strip virtio-net header to convert the output to
> Ethernet.
> 
> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>

Probably means you need to calculate checksums and split gso too right?

> ---
>  include/net/net.h |  6 ++++++
>  net/dump.c        | 11 +++++++----
>  net/net.c         | 18 ++++++++++++++++++
>  net/tap.c         | 16 ++++++++++++++++
>  4 files changed, 47 insertions(+), 4 deletions(-)
> 
> diff --git a/include/net/net.h b/include/net/net.h
> index dc20b31e9f..4b2d72b3fc 100644
> --- a/include/net/net.h
> +++ b/include/net/net.h
> @@ -56,8 +56,10 @@ typedef RxFilterInfo *(QueryRxFilter)(NetClientState *);
>  typedef bool (HasUfo)(NetClientState *);
>  typedef bool (HasVnetHdr)(NetClientState *);
>  typedef bool (HasVnetHdrLen)(NetClientState *, int);
> +typedef bool (GetUsingVnetHdr)(NetClientState *);
>  typedef void (UsingVnetHdr)(NetClientState *, bool);
>  typedef void (SetOffload)(NetClientState *, int, int, int, int, int);
> +typedef int (GetVnetHdrLen)(NetClientState *);
>  typedef void (SetVnetHdrLen)(NetClientState *, int);
>  typedef int (SetVnetLE)(NetClientState *, bool);
>  typedef int (SetVnetBE)(NetClientState *, bool);
> @@ -84,8 +86,10 @@ typedef struct NetClientInfo {
>      HasUfo *has_ufo;
>      HasVnetHdr *has_vnet_hdr;
>      HasVnetHdrLen *has_vnet_hdr_len;
> +    GetUsingVnetHdr *get_using_vnet_hdr;
>      UsingVnetHdr *using_vnet_hdr;
>      SetOffload *set_offload;
> +    GetVnetHdrLen *get_vnet_hdr_len;
>      SetVnetHdrLen *set_vnet_hdr_len;
>      SetVnetLE *set_vnet_le;
>      SetVnetBE *set_vnet_be;
> @@ -183,9 +187,11 @@ void qemu_format_nic_info_str(NetClientState *nc, uint8_t macaddr[6]);
>  bool qemu_has_ufo(NetClientState *nc);
>  bool qemu_has_vnet_hdr(NetClientState *nc);
>  bool qemu_has_vnet_hdr_len(NetClientState *nc, int len);
> +bool qemu_get_using_vnet_hdr(NetClientState *nc);
>  void qemu_using_vnet_hdr(NetClientState *nc, bool enable);
>  void qemu_set_offload(NetClientState *nc, int csum, int tso4, int tso6,
>                        int ecn, int ufo);
> +int qemu_get_vnet_hdr_len(NetClientState *nc);
>  void qemu_set_vnet_hdr_len(NetClientState *nc, int len);
>  int qemu_set_vnet_le(NetClientState *nc, bool is_le);
>  int qemu_set_vnet_be(NetClientState *nc, bool is_be);
> diff --git a/net/dump.c b/net/dump.c
> index 6a63b15359..7d05f16ca7 100644
> --- a/net/dump.c
> +++ b/net/dump.c
> @@ -61,12 +61,13 @@ struct pcap_sf_pkthdr {
>      uint32_t len;
>  };
>  
> -static ssize_t dump_receive_iov(DumpState *s, const struct iovec *iov, int cnt)
> +static ssize_t dump_receive_iov(DumpState *s, const struct iovec *iov, int cnt,
> +                                int offset)
>  {
>      struct pcap_sf_pkthdr hdr;
>      int64_t ts;
>      int caplen;
> -    size_t size = iov_size(iov, cnt);
> +    size_t size = iov_size(iov, cnt) - offset;
>      struct iovec dumpiov[cnt + 1];
>  
>      /* Early return in case of previous error. */
> @@ -84,7 +85,7 @@ static ssize_t dump_receive_iov(DumpState *s, const struct iovec *iov, int cnt)
>  
>      dumpiov[0].iov_base = &hdr;
>      dumpiov[0].iov_len = sizeof(hdr);
> -    cnt = iov_copy(&dumpiov[1], cnt, iov, cnt, 0, caplen);
> +    cnt = iov_copy(&dumpiov[1], cnt, iov, cnt, offset, caplen);
>  
>      if (writev(s->fd, dumpiov, cnt + 1) != sizeof(hdr) + caplen) {
>          error_report("network dump write error - stopping dump");
> @@ -153,8 +154,10 @@ static ssize_t filter_dump_receive_iov(NetFilterState *nf, NetClientState *sndr,
>                                         int iovcnt, NetPacketSent *sent_cb)
>  {
>      NetFilterDumpState *nfds = FILTER_DUMP(nf);
> +    int offset = qemu_get_using_vnet_hdr(nf->netdev) ?
> +                 qemu_get_vnet_hdr_len(nf->netdev) : 0;
>  
> -    dump_receive_iov(&nfds->ds, iov, iovcnt);
> +    dump_receive_iov(&nfds->ds, iov, iovcnt, offset);
>      return 0;
>  }
>  
> diff --git a/net/net.c b/net/net.c
> index 2d01472998..03f17de5fc 100644
> --- a/net/net.c
> +++ b/net/net.c
> @@ -513,6 +513,15 @@ bool qemu_has_vnet_hdr_len(NetClientState *nc, int len)
>      return nc->info->has_vnet_hdr_len(nc, len);
>  }
>  
> +bool qemu_get_using_vnet_hdr(NetClientState *nc)
> +{
> +    if (!nc || !nc->info->get_using_vnet_hdr) {
> +        return false;
> +    }
> +
> +    return nc->info->get_using_vnet_hdr(nc);
> +}
> +
>  void qemu_using_vnet_hdr(NetClientState *nc, bool enable)
>  {
>      if (!nc || !nc->info->using_vnet_hdr) {
> @@ -532,6 +541,15 @@ void qemu_set_offload(NetClientState *nc, int csum, int tso4, int tso6,
>      nc->info->set_offload(nc, csum, tso4, tso6, ecn, ufo);
>  }
>  
> +int qemu_get_vnet_hdr_len(NetClientState *nc)
> +{
> +    if (!nc || !nc->info->get_vnet_hdr_len) {
> +        return 0;
> +    }
> +
> +    return nc->info->get_vnet_hdr_len(nc);
> +}
> +
>  void qemu_set_vnet_hdr_len(NetClientState *nc, int len)
>  {
>      if (!nc || !nc->info->set_vnet_hdr_len) {
> diff --git a/net/tap.c b/net/tap.c
> index 7d7bc1dc5f..1bf085d422 100644
> --- a/net/tap.c
> +++ b/net/tap.c
> @@ -255,6 +255,13 @@ static bool tap_has_vnet_hdr_len(NetClientState *nc, int len)
>      return !!tap_probe_vnet_hdr_len(s->fd, len);
>  }
>  
> +static int tap_get_vnet_hdr_len(NetClientState *nc)
> +{
> +    TAPState *s = DO_UPCAST(TAPState, nc, nc);
> +
> +    return s->host_vnet_hdr_len;
> +}
> +
>  static void tap_set_vnet_hdr_len(NetClientState *nc, int len)
>  {
>      TAPState *s = DO_UPCAST(TAPState, nc, nc);
> @@ -268,6 +275,13 @@ static void tap_set_vnet_hdr_len(NetClientState *nc, int len)
>      s->host_vnet_hdr_len = len;
>  }
>  
> +static bool tap_get_using_vnet_hdr(NetClientState *nc)
> +{
> +    TAPState *s = DO_UPCAST(TAPState, nc, nc);
> +
> +    return s->using_vnet_hdr;
> +}
> +
>  static void tap_using_vnet_hdr(NetClientState *nc, bool using_vnet_hdr)
>  {
>      TAPState *s = DO_UPCAST(TAPState, nc, nc);
> @@ -372,8 +386,10 @@ static NetClientInfo net_tap_info = {
>      .has_ufo = tap_has_ufo,
>      .has_vnet_hdr = tap_has_vnet_hdr,
>      .has_vnet_hdr_len = tap_has_vnet_hdr_len,
> +    .get_using_vnet_hdr = tap_get_using_vnet_hdr,
>      .using_vnet_hdr = tap_using_vnet_hdr,
>      .set_offload = tap_set_offload,
> +    .get_vnet_hdr_len = tap_get_vnet_hdr_len,
>      .set_vnet_hdr_len = tap_set_vnet_hdr_len,
>      .set_vnet_le = tap_set_vnet_le,
>      .set_vnet_be = tap_set_vnet_be,
> -- 
> 2.39.1


