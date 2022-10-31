Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0119612F4D
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 04:21:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opLLX-0002UQ-US; Sun, 30 Oct 2022 23:20:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1opLLW-0002Pp-7H
 for qemu-devel@nongnu.org; Sun, 30 Oct 2022 23:20:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1opLLU-0004FE-Kq
 for qemu-devel@nongnu.org; Sun, 30 Oct 2022 23:20:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667186415;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rQJtPB7MkGbhLKDBoaNRPWr0daPVJdvp+sYQONhhuiU=;
 b=BYiFkkY347V1ozlK7FL9HvdNU86K43fZa2gVq4ffw1B+1qlOMApCbpIFjKbratNWMBJOZe
 fh1PfznWbIVk/oa6WCYU2RoIzgYUszcrKQZYDKCi2LvQ6H3sCDopJF52c1el5P96HNuT6A
 y/wxtkoHhpJ0fUH4Nxwz+gLceTAkwlM=
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com
 [209.85.166.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-622-fA4EhdAgMN-ZjUhF5_dFpA-1; Sun, 30 Oct 2022 23:20:13 -0400
X-MC-Unique: fA4EhdAgMN-ZjUhF5_dFpA-1
Received: by mail-io1-f70.google.com with SMTP id
 g13-20020a056602072d00b006c60d59110fso6887488iox.12
 for <qemu-devel@nongnu.org>; Sun, 30 Oct 2022 20:20:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:organization:references
 :in-reply-to:message-id:subject:cc:to:from:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=rQJtPB7MkGbhLKDBoaNRPWr0daPVJdvp+sYQONhhuiU=;
 b=SKpEuk4T5H/yua+8AUg8ysFGzvkxS1EhLbwiuat8mrugajd9pUpDwfnlKFUSNZUkX1
 IccwpxczZfjSVh45mgxtTJAlwlhGWgz6dYO3bWL16ys5FR+/Inl0uOyn33SJgZ34f+NN
 5lWuKoPfFwCSmTHk6pof9hSqEOxfC8h3N9dV8Onlfk8v6va+uVOPNpr3aa8NMjEhm4Az
 WmboVMS1rfX980kGIWpPl6D1a0f6vl1N6X7X/1QXE1IKZb4776J5dOZHF5zwUiwhuuR0
 3NmQm6dH87I61w2vbN2CkcwWkKDdcIdCQ8I4WwO1blYry38fzWyjqECE+EqEutH1qfgm
 jesA==
X-Gm-Message-State: ACrzQf3Wq4gH37qggFsTUcLPavDw2/IVmPCzAodyfDysXwvp2w5uKGly
 u5Am1vHCBNMLgEZwSxoChj1Kd0fK9M7UsyfpYxFGzSBGb0IrgEKGWoRKqrs1+IAPSpFqj1vhbYV
 EUkarrkkaa8kLCKY=
X-Received: by 2002:a05:6638:4190:b0:372:4b79:5d93 with SMTP id
 az16-20020a056638419000b003724b795d93mr6215754jab.216.1667186413027; 
 Sun, 30 Oct 2022 20:20:13 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4oDWSlVo6WkaS0P9Egz1CxepDlP7QiKFeyEVNIVqOzZqat+A9g5X/ttYxp9xod0Uaz2UR9Pw==
X-Received: by 2002:a05:6638:4190:b0:372:4b79:5d93 with SMTP id
 az16-20020a056638419000b003724b795d93mr6215740jab.216.1667186412826; 
 Sun, 30 Oct 2022 20:20:12 -0700 (PDT)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 y88-20020a029561000000b00363aefdf040sm2312181jah.83.2022.10.30.20.20.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Oct 2022 20:20:12 -0700 (PDT)
Date: Sun, 30 Oct 2022 21:20:11 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Cindy Lu <lulu@redhat.com>
Cc: jasowang@redhat.com, mst@redhat.com, pbonzini@redhat.com,
 peterx@redhat.com, david@redhat.com, f4bug@amsat.org, sgarzare@redhat.com,
 qemu-devel@nongnu.org
Subject: Re: [PATCH v9 1/2] vfio: move implement of vfio_get_xlat_addr() to
 memory.c
Message-ID: <20221030212011.45c3d924.alex.williamson@redhat.com>
In-Reply-To: <20221031031020.1405111-2-lulu@redhat.com>
References: <20221031031020.1405111-1-lulu@redhat.com>
 <20221031031020.1405111-2-lulu@redhat.com>
Organization: Red Hat
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.055,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, 31 Oct 2022 11:10:19 +0800
Cindy Lu <lulu@redhat.com> wrote:

> - Move the implement vfio_get_xlat_addr to softmmu/memory.c, and
>   change the name to memory_get_xlat_addr(). So we can use this
>   function on other devices, such as vDPA device.
> - Add a new function vfio_get_xlat_addr in vfio/common.c, and it will check
>   whether the memory is backed by a discard manager. then device can
>   have its own warning.
> 
> Signed-off-by: Cindy Lu <lulu@redhat.com>
> ---
>  hw/vfio/common.c      | 66 +++------------------------------------
>  include/exec/memory.h |  4 +++
>  softmmu/memory.c      | 72 +++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 81 insertions(+), 61 deletions(-)

Acked-by: Alex Williamson <alex.williamson@redhat.com>


