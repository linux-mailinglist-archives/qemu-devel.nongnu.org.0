Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 229962B6C59
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Nov 2020 18:51:49 +0100 (CET)
Received: from localhost ([::1]:41814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kf58t-0003Mo-MD
	for lists+qemu-devel@lfdr.de; Tue, 17 Nov 2020 12:51:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1kf57o-0002v5-QS
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 12:50:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:32158)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1kf57n-0003Nf-5D
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 12:50:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605635437;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=44jqumth3fTGyPN5RLQ7JVghr3fCJtZFroeq5qbJqDs=;
 b=Je9eLrDPzEDZdt/C3oLnYBubr4HRODLdy6DZTLi+rg24EYVXtfxl4QVSdveTilI5eCaix8
 xhohoZ4bTScrxtUbohohyr3ym2Mq3o/NKIVMFQaWuOoj90fT/oIbMz84HUYeAN2QJ6VUvf
 rdW79nBUO4XNmV8IbbHfeGw3PKmbYz0=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-338-MhLUze0MOL6_E4aUZIGAgw-1; Tue, 17 Nov 2020 12:50:34 -0500
X-MC-Unique: MhLUze0MOL6_E4aUZIGAgw-1
Received: by mail-wr1-f70.google.com with SMTP id n4so12448100wrt.8
 for <qemu-devel@nongnu.org>; Tue, 17 Nov 2020 09:50:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=WgKbQj9WxZdm1ijOeD20XPMN5zBAaatuN6wLHO0IXFE=;
 b=hNpAl+gTTICRXgcT+O4IG1w/eLBnEPuNRb5y5a9YrF3d5j6NcNEDfdCxQ9LGSA7JWC
 qil0PRLEfLOa9rWBadoIcUyatNwsDnayMIfuIKAAE/U8T5cwkZY+pdz6VCa4QcIVI3TR
 UMnJriraUjj2rEgbA/9/k7QA5k2YQktoSJ3rmvlNRN5zoonkpZroeMwj5FQ/Zd0nXM0a
 lxJ4CI50/qJiqwyX7uROPcI4+FpCyhG7bQHW2sfsazS0zM6oSowFOL7/p1mnAy/Daz+u
 1C0BzDTYimx7t1kJfQFCEDBmSlafTX0wSAMhX1E7jGan3xSL9xHYmXCUYP1p27Gew6QC
 rmgg==
X-Gm-Message-State: AOAM533JujWgbv1AKsYWXGMMDBIxJthq2vj3jAec7FwCE0O040HcojlU
 5kPaCSWQI9kHzl0+MvyQPQHngYTRE7j6E97tc6fadMujHDBXDmGb7bLjrgWNvhESgvvbR/eEvEt
 peqxZ1waT7ZDno8I=
X-Received: by 2002:adf:8521:: with SMTP id 30mr670315wrh.265.1605635433037;
 Tue, 17 Nov 2020 09:50:33 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy4z0zOIzKhap6nKXtwGbEkFi9ZAZWfdfTurmOu7LssyiZl38tBV/NuW2Kt+6eZCrkxKZTaig==
X-Received: by 2002:adf:8521:: with SMTP id 30mr670296wrh.265.1605635432810;
 Tue, 17 Nov 2020 09:50:32 -0800 (PST)
Received: from steredhat (host-79-17-248-175.retail.telecomitalia.it.
 [79.17.248.175])
 by smtp.gmail.com with ESMTPSA id b8sm4320608wmj.9.2020.11.17.09.50.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Nov 2020 09:50:32 -0800 (PST)
Date: Tue, 17 Nov 2020 18:50:30 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: Stefan Weil <sw@weilnetz.de>
Subject: Re: Regressions in build process introduced since August
Message-ID: <20201117175030.eqz5run2m7qmx5qt@steredhat>
References: <97b04446-ca94-cebd-2d8d-4c2013521208@weilnetz.de>
MIME-Version: 1.0
In-Reply-To: <97b04446-ca94-cebd-2d8d-4c2013521208@weilnetz.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/17 00:41:22
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

CCing Paolo and Marc-André who worked on meson integrations.

On Sun, Nov 15, 2020 at 11:57:25AM +0100, Stefan Weil wrote:
>Dear all,
>
>yesterday I tried to build new QEMU installers for Windows and noticed 
>two regressions which break my build process:
>
>*** Change in handling of --extra-cflags
>
>Running `configure [...] --extra-cflags="-I /xyz"` results in compiler 
>flags `-I [...] /xyz`, so the `-I` and `/xyz` are separated by other 
>compiler flags which obviously cannot work as expected. I could work 
>around that by removing the space and using a pattern like `-I/xyz`.
>
>This regression is not restricted to builds targeting Windows.
>
>*** Setting INSTALLER no longer handled
>
>meson.build sets a hard name for the Windows installer executable: 
>installer = 'qemu-setup-' + meson.project_version() + '.exe'.
>
>Previously the installer name could be changed by running `make 
>installer INSTALLER=qemu-setup-something.exe`. This no longer works. 
>Is there an alternative solution how the name of the installer 
>executable can be set? Or how could I reimplement the lost 
>functionality?
>
>Kind regards
>
>Stefan Weil
>
>
>
>


