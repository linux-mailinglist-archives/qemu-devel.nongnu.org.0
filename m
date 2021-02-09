Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE0DD3151C9
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 15:37:34 +0100 (CET)
Received: from localhost ([::1]:59238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9U8z-0008Kk-UW
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 09:37:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1l9U67-0007Ne-8k
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 09:34:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:50942)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1l9U5z-0006SI-Tk
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 09:34:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612881267;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7GLnpWB0NSBoNRdDidrygmhY1yLVekvkBV4sw47p6kE=;
 b=MuPcYS8LoaAiXyygU0E8mvTjstRqsJpqYfEClaVVhfuXnYqzP73kQ8TZgwch2vkNpMM3n4
 /OrOjHbR+zf5SPfHPTXiysxU52zNIc6L+A7ncO4Ba9fTGJ2C7THfE2yr9Nvr1OXau+o5OH
 4/9pWeLLdN8JGSpC4mL9LEGsIl+VnUM=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-452-R3_-u7v5MceDYLcUQpKRrg-1; Tue, 09 Feb 2021 09:34:25 -0500
X-MC-Unique: R3_-u7v5MceDYLcUQpKRrg-1
Received: by mail-wr1-f70.google.com with SMTP id j8so17147140wrx.17
 for <qemu-devel@nongnu.org>; Tue, 09 Feb 2021 06:34:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=7GLnpWB0NSBoNRdDidrygmhY1yLVekvkBV4sw47p6kE=;
 b=Ss1W3WfEvfqeSJ/gfVySLKYGcZgsNStD3T46HlZKPVrvujR4fJuiL1vJu0Fi4X3L79
 h21PiJP88zV2US8URDqvYo0kz5qSo7X1F4M7qY2HewPSF12RdNjjQVtKnznF4N+lDjgT
 DQ911tkIDVPnXRRJ52OvqSESqfr/9ETziJXtOKJrQGS1IkC2478bTDHjWBvZMPazEMKH
 fJkD59Zvk6QDMzkwaDajMITxpg+x+v8eaT+Z/ka3i9kSRJ6Fpaf9W+DxTn0dVZxlycWX
 qtYeqynVS7w7a+SmXBm5NS49dXHxgcqhZLF80rGF7rg/ttSyIf/PRpg2XYbiRe1XpKLe
 t6qw==
X-Gm-Message-State: AOAM531eHO7rRy3Y34VWranCzifxpdRdraG1DCFRgFTkvpADnGht+HZD
 FYfhPnCvBpsVDI6+U3b00djCYUXGtoH+uQTu4XTuQlQ9xnrrCJv9LNQJ8pMbB4NQZBRCyQqp72R
 5U8XGKOJO+v810HU=
X-Received: by 2002:a5d:50d2:: with SMTP id f18mr26937616wrt.338.1612881264011; 
 Tue, 09 Feb 2021 06:34:24 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzJsy6TH67kM1KjbHxLNT7qrKEIH3+mxSAEzuqsjF5X+Mf+ZnBiMoqU7ibd4KmPtNddcpuJxA==
X-Received: by 2002:a5d:50d2:: with SMTP id f18mr26937598wrt.338.1612881263792; 
 Tue, 09 Feb 2021 06:34:23 -0800 (PST)
Received: from redhat.com (bzq-79-180-2-31.red.bezeqint.net. [79.180.2.31])
 by smtp.gmail.com with ESMTPSA id r1sm35915528wrl.95.2021.02.09.06.34.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Feb 2021 06:34:23 -0800 (PST)
Date: Tue, 9 Feb 2021 09:34:20 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Yuri Benditovich <yuri.benditovich@daynix.com>
Subject: Re: [PATCH 0/3] virtio-net: graceful drop of vhost for TAP
Message-ID: <20210209093201-mutt-send-email-mst@kernel.org>
References: <20210204202915.15925-1-yuri.benditovich@daynix.com>
MIME-Version: 1.0
In-Reply-To: <20210204202915.15925-1-yuri.benditovich@daynix.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.57,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: yan@daynix.com, jasowang@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Feb 04, 2021 at 10:29:12PM +0200, Yuri Benditovich wrote:
> This set of patches introduces graceful switch from tap-vhost to
> tap-no-vhost depending on guest features. Before that the features
> that vhost does not support were silently cleared in get_features.
> This creates potential problem of migration from the machine where
> some of virtio-net features are supported by the vhost kernel to the
> machine where they are not supported (packed ring as an example).

I still worry that adding new features will silently disable vhost for people.
Can we limit the change to when a VM is migrated in?



> Instead of silent masking of the features virtio-net gracefully
> disables the vhost at set_features if some features acked by the
> guest contradict with kernel vhost capabilities.
> 
> This set of patches also makes get_vhost_net() call (that used
> everywhere) to always return actual result, i.e. initially it
> returns non-NULL value and from the moment the vhost was disabled
> the call will return NULL. Such a way we avoid any unexpected
> calls to vhost functions.
> Yuri Benditovich (3):
>   vhost-net: add VIRTIO_NET_F_HASH_REPORT to the list of kernel features
>   net: add ability to hide (disable) vhost_net
>   virtio-net: graceful fallback to vhost=off for tap netdev
> 
>  hw/net/vhost_net.c  |  5 +++-
>  hw/net/virtio-net.c | 58 ++++++++++++++++++++++++++++++++++++++-------
>  include/net/net.h   |  1 +
>  3 files changed, 55 insertions(+), 9 deletions(-)
> 
> -- 
> 2.17.1


