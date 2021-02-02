Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB7C230CFC5
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 00:16:18 +0100 (CET)
Received: from localhost ([::1]:33206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l74u9-0006dA-T3
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 18:16:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1l74rw-00050G-R6
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 18:14:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:20117)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1l74ru-0001Tu-HA
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 18:14:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612307637;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=pGuFyEX3rvrTbdtqo7RRt5GCOh5WmpOWCfCD4hkym4M=;
 b=Ar2GlxVzVXSojPvnNEUHPuXaB024X7KrdSZq/ktxHLRgEHNW6YwIXZQrJ7pCYySi57xiuU
 +o1AOFEHfwR6LarJb7uTiSQvjZGwXCRmmY9Ey1vmb0jWqDrtK0Rik9QWmcXh24NaG5qeo1
 gv55y0Zgk+KH8e4GMsYQxqKXiHNnTxc=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-276-LhjjhC30Ppi6-eN_muDfgg-1; Tue, 02 Feb 2021 18:13:55 -0500
X-MC-Unique: LhjjhC30Ppi6-eN_muDfgg-1
Received: by mail-wm1-f71.google.com with SMTP id b201so2147420wmb.9
 for <qemu-devel@nongnu.org>; Tue, 02 Feb 2021 15:13:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=pGuFyEX3rvrTbdtqo7RRt5GCOh5WmpOWCfCD4hkym4M=;
 b=ZsoYWdxjGKC59HytFsNvaFTOD08Rgttt0FyYCh3x0Gx1mCWVmWQVUIj/y72xK51Ss3
 zxnnSOOK2X8oW1TcEFCZfm9UTyC+Vyfqw4Ghp8hr2XpynPRXi2bpxfU7XYD56Jk1kc16
 SWgjAMlBnLyDLHub+EIXh5wCGHQl4A1MKp9NHiXtx2gJ1hAwzSvNSPrL22Gvzm9Zyqyn
 AXnl9FeE6+0SKqhbfjvDtZ6zmyUsVcJEr2QLpE6ITrvJpkdPF2P7j0XeEWUZstLaeKam
 0a96IynR4B2Dd3STHXYt+c5HfPbSJy3vTd87AXOpX1tknAWzDm8Xy0Dc0wSLgoKYeonC
 d5Rg==
X-Gm-Message-State: AOAM530oF9UfLTAiL9OsxbuDF+bHGUOePOChNTBz57Ilh0VHkittqj7w
 Xe5l6ZS7m+EV7N6sTVJ6RlmUG0UrSVJNstR2Jwv2SRydzA1iSyUw8I/9OxOcENKvQcIc0slqexc
 uvS2jC+mNJjhNTiw=
X-Received: by 2002:a7b:c041:: with SMTP id u1mr231089wmc.161.1612307634724;
 Tue, 02 Feb 2021 15:13:54 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxzZkz86NCefzDjGTtBNlMToWluncVgSfg/7HlXcxVlkjXBXtMYXqPXZDwI/roHbvOrrxCqjA==
X-Received: by 2002:a7b:c041:: with SMTP id u1mr230957wmc.161.1612307631821;
 Tue, 02 Feb 2021 15:13:51 -0800 (PST)
Received: from redhat.com (bzq-79-177-39-148.red.bezeqint.net. [79.177.39.148])
 by smtp.gmail.com with ESMTPSA id r12sm197804wrp.13.2021.02.02.15.13.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Feb 2021 15:13:51 -0800 (PST)
Date: Tue, 2 Feb 2021 18:13:47 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Ben Widawsky <ben@bwidawsk.net>
Subject: Re: [RFC PATCH 1/4] include/standard-headers/linux/pci_regs: temp
 hack to add necessary DOE definitions.
Message-ID: <20210202181305-mutt-send-email-mst@kernel.org>
References: <20210201151629.29656-1-Jonathan.Cameron@huawei.com>
 <20210201151629.29656-2-Jonathan.Cameron@huawei.com>
 <20210202153951.2i6qxd63wk5xw2rm@mail.bwidawsk.net>
MIME-Version: 1.0
In-Reply-To: <20210202153951.2i6qxd63wk5xw2rm@mail.bwidawsk.net>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.386,
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
Cc: Thomas Huth <thuth@redhat.com>, linuxarm@openeuler.org,
 Vishal Verma <vishal.l.verma@intel.com>, f.fangjian@huawei.com,
 Chris Browy <cbrowy@avery-design.com>, qemu-devel@nongnu.org, f4bug@amsat.org,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Prashant V Agarwal <agpr123@gmail.com>, Igor Mammedov <imammedo@redhat.com>,
 Dan Williams <dan.j.williams@intel.com>, jcm@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Feb 02, 2021 at 07:39:51AM -0800, Ben Widawsky wrote:
> On 21-02-01 23:16:26, Jonathan Cameron wrote:
> > Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> > ---
> >  include/standard-headers/linux/pci_regs.h | 33 ++++++++++++++++++++++-
> >  1 file changed, 32 insertions(+), 1 deletion(-)
> > 
> > diff --git a/include/standard-headers/linux/pci_regs.h b/include/standard-headers/linux/pci_regs.h
> > index e709ae8235..7e852d3dd0 100644
> > --- a/include/standard-headers/linux/pci_regs.h
> > +++ b/include/standard-headers/linux/pci_regs.h
> > @@ -730,7 +730,8 @@
> >  #define PCI_EXT_CAP_ID_DVSEC	0x23	/* Designated Vendor-Specific */
> >  #define PCI_EXT_CAP_ID_DLF	0x25	/* Data Link Feature */
> >  #define PCI_EXT_CAP_ID_PL_16GT	0x26	/* Physical Layer 16.0 GT/s */
> > -#define PCI_EXT_CAP_ID_MAX	PCI_EXT_CAP_ID_PL_16GT
> > +#define PCI_EXT_CAP_ID_DOE	0x2E	/* Data Object Exchange */
> > +#define PCI_EXT_CAP_ID_MAX	PCI_EXT_CAP_ID_DOE
> >  
> >  #define PCI_EXT_CAP_DSN_SIZEOF	12
> >  #define PCI_EXT_CAP_MCAST_ENDPOINT_SIZEOF 40
> > @@ -1092,4 +1093,34 @@
> >  #define  PCI_PL_16GT_LE_CTRL_USP_TX_PRESET_MASK		0x000000F0
> >  #define  PCI_PL_16GT_LE_CTRL_USP_TX_PRESET_SHIFT	4
> >  
> > +/* Data Object Exchange */
> > +#define PCI_DOE_CAP		0x04
> > +#define  PCI_DOE_CAP_INT_SUPPORT			0x00000001
> > +#define  PCI_DOE_CAP_INT_MSG_NUM			0x00000FFE
> > +
> > +#define PCI_DOE_CTRL		0x08
> > +#define  PCI_DOE_CTRL_DOE_ABORT				0x00000001
> > +#define  PCI_DOE_CTRL_DOE_INT_EN			0x00000002
> > +#define  PCI_DOE_CTRL_DOE_GO				0x80000000
> > +
> > +#define PCI_DOE_STATUS		0x0c
> > +#define  PCI_DOE_STATUS_DOE_BUSY			0x00000001
> > +#define  PCI_DOE_STATUS_INT_STATUS			0x00000002
> > +#define  PCI_DOE_STATUS_DOE_ERROR			0x00000004
> > +#define  PCI_DOE_STATUS_DATA_OBJECT_READY		0x80000000
> > +
> > +#define PCI_DOE_WRITE_MAILBOX	0x10
> > +#define PCI_DOE_READ_MAILBOX	0x14
> > +
> > +/* Data Object Format DOE ECN 6.xx.1 */
> > +#define PCI_DATA_OBJ_DW0_VID				0x0000ffff
> > +#define PCI_DATA_OBJ_DW0_TYPE				0x00ff0000
> > +#define PCI_DATA_OBJ_DW1_LEN				0x0003ffff
> > +
> > +/* DOE Discover Data Object */
> > +#define PCI_DOE_DIS_OBJ_TYPE	 0x1
> > +#define PCI_DOE_DIS_REQ_D0_DW0_INDEX			0x000000ff
> > +#define PCI_DOE_DIS_RSP_DO_DW0_VID			0x0000ffff
> > +#define PCI_DOE_DIS_RSP_D0_DW0_PROT			0x00ff0000
> > +#define PCI_DOE_DIS_RSP_D0_DW0_NEXT_INDEX		0xff000000
> >  #endif /* LINUX_PCI_REGS_H */
> 
> I think a lot of these should have had _MASK at the end.
> 
> As for the accuracy of the values, lgtm.

just add them in the source file where they are used.
standard-headers are over-written by scripts, adding
your own macros there won't help.


