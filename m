Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 251C348BC6D
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jan 2022 02:28:56 +0100 (CET)
Received: from localhost ([::1]:51516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7SRb-0001Se-8f
	for lists+qemu-devel@lfdr.de; Tue, 11 Jan 2022 20:28:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1n7SMh-0006wv-Mc
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 20:23:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:50539)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1n7SMe-0003Dl-W6
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 20:23:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641950628;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lvjd6/In+7bkiKQuP0ohCbRbQ87AfI2jVKQj1OjLQ80=;
 b=Im0rNHgVunISrScEHCEGnrbvr2rke/Xd4qY7W5kJArC3SCdRqkFZz+/sB6nDCSeS81r3JW
 hWpAgQ0pZAjMgZuycUV/Q68cpHZWE1ua9xOKUZt1vPW94iHiWauTZiywYa2zQs6sNrFTv5
 hw2tqKyDrwotYD4wf8AJxssc4mfb/RM=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-237-eJ9Ijf_dO9SV76Mrublchg-1; Tue, 11 Jan 2022 20:23:47 -0500
X-MC-Unique: eJ9Ijf_dO9SV76Mrublchg-1
Received: by mail-pl1-f198.google.com with SMTP id
 u14-20020a170902714e00b00148ee2b06efso1027413plm.5
 for <qemu-devel@nongnu.org>; Tue, 11 Jan 2022 17:23:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=lvjd6/In+7bkiKQuP0ohCbRbQ87AfI2jVKQj1OjLQ80=;
 b=GFTy3ybSCNj7+4cS94Ba/E1YEyTx2LpNYT7Y1MjQh7LIEXW9FH4JUKxV4p2XoPC2w3
 +9Tt3icVHdV1ofAw5xqnaNmj6NoE+OAHcZraQavtlDcxZ9AeFqzGiI0kr33EliiNzWe2
 PtnaJtbz/x5j8scj/5yYSiH5idpHPB3GTMDQno/Tc73wxIG4PvoATkmYhit9e8hNWLYA
 gwQisNjUSoiw842gZIkNCHEs5+ppr59glslIrNBYKv0WN2+JlGjUNbA3FWWL3tXkw6sr
 ohe7FS8L/eqKL4jmMMFgxYAkbpLMvmp7DsFwORLfx/7tEY/JAEgyQ4pZM0PJQlJBk3HF
 zqpQ==
X-Gm-Message-State: AOAM533MSaETzPUctcpqJVyoeKLst73DuiMkV0q/4NzL8siacckUiSEX
 h32cruuCBL41o2zXivF+CbIV1bvNrSnRtdMSh50gPFHkd9L0Vo2WlKCkZ67ZvbaJgi6IhXBdHMB
 0FLScfj5f90RZPls=
X-Received: by 2002:a63:7a41:: with SMTP id j1mr6394467pgn.20.1641950625947;
 Tue, 11 Jan 2022 17:23:45 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx3Wq4pbv0QqPSSDRRv9hxcNa7pnehOdq9NsSg3xcJfU1ftYLax/CnHHPTy6H+FZz8v4AXScQ==
X-Received: by 2002:a63:7a41:: with SMTP id j1mr6394445pgn.20.1641950625555;
 Tue, 11 Jan 2022 17:23:45 -0800 (PST)
Received: from xz-m1.local ([191.101.132.69])
 by smtp.gmail.com with ESMTPSA id t1sm5880847pfg.29.2022.01.11.17.23.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jan 2022 17:23:44 -0800 (PST)
Date: Wed, 12 Jan 2022 09:23:39 +0800
From: Peter Xu <peterx@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH v3 00/10] hw/dma: Use dma_addr_t type definition when
 relevant
Message-ID: <Yd4tm2+ViezI0mPw@xz-m1.local>
References: <20220111184309.28637-1-f4bug@amsat.org>
MIME-Version: 1.0
In-Reply-To: <20220111184309.28637-1-f4bug@amsat.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.595,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org,
 David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jan 11, 2022 at 07:42:59PM +0100, Philippe Mathieu-Daudé wrote:
> Since v2:
> - Split meson patch restricting fw_cfg (Richard)
> - Reorder pci_dma_map() docstring (Peter, Richard)
> - Move QEMUSGList in previous patch (David)
> - Have dma_buf_read/dma_buf_write return dma_addr_t (Peter)
> - Drop 'propagate MemTxResult' patch (David)
> - Added R-b tags

Reviewed-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu


