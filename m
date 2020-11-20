Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 160392BAB86
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Nov 2020 14:50:39 +0100 (CET)
Received: from localhost ([::1]:36856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kg6oA-000248-6D
	for lists+qemu-devel@lfdr.de; Fri, 20 Nov 2020 08:50:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43628)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kg6nG-00015J-05
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 08:49:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59430)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kg6nC-0000su-Pr
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 08:49:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605880178;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9c3QxQmiYvM/6yyNjMbrnRHfjUP8Qv48FkongMzH/8E=;
 b=AKX84CSNoM5omcv/QzklGpPTlCxQglbdsmmOqlD7Lt7oQ/sRaqvwVZ7sbCHKBjnYEKhxLD
 hs/f0B2a0Y2LQ+mEMpjjUqcb6GirEqyIXYJUQRoou1xb9oYslvF14AISZGOG82mi5rUuCO
 dnUAmdBuU8NA7GFkcKQ/TqEQ0ovBgO0=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-407-Gh2taX6jOMGo1MQXXZHGGQ-1; Fri, 20 Nov 2020 08:49:36 -0500
X-MC-Unique: Gh2taX6jOMGo1MQXXZHGGQ-1
Received: by mail-wr1-f72.google.com with SMTP id z13so3411574wrm.19
 for <qemu-devel@nongnu.org>; Fri, 20 Nov 2020 05:49:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=9c3QxQmiYvM/6yyNjMbrnRHfjUP8Qv48FkongMzH/8E=;
 b=toibexCG4mEyKFfbHKG1dzth9lxMIGC4+ckmnZma7IiOvvIBA6DDViddfsZM8AywdR
 n0i6wJx3AsUKoRrh+5QsF62B78a+kUGDSye/3QSclBilJrC5+NSwO1yGjoZRfm+5KdH6
 lnn0sCBuNh1ZGSVN0zt/G/J88OKLFeqmcYyOX4hgf1/PP6LUTl0RZEF5ylVxX/XG5vCb
 LH4aMwvZwW3uRWDJVyTPVQ0P8Njjrxmk7Z8Hz0XQMvm8OSJMusPOIu+bLIHvhgZjzL0E
 kBzkosKCKqWm+8y5DyL0cy30Ph0xEF1kFht9hA9I/lwFcKmYLV3IOAWDY94XbQV7nYHh
 t97Q==
X-Gm-Message-State: AOAM532ytxs1CkoggniDJ7grBT0N201GnW8SV3JkIeBS9ghw8rbvt2O4
 Xw0Z4sc+cRyAXlNavniyYTlZHCn19rK4hih6ishlHaUhXCVs7TvyuPQdzrRd32F/zVTAQ9ASle3
 reU9DRmqaS6zanWE=
X-Received: by 2002:a7b:c3d5:: with SMTP id t21mr9611973wmj.37.1605880175412; 
 Fri, 20 Nov 2020 05:49:35 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzjWZjBjtcUY7VXGaBJ95c4pv6XQKouOORx4V97ZoXibopZki/fb2+rMOTNHiJZKma5MTnrkw==
X-Received: by 2002:a7b:c3d5:: with SMTP id t21mr9611955wmj.37.1605880175230; 
 Fri, 20 Nov 2020 05:49:35 -0800 (PST)
Received: from [192.168.1.36] (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id t13sm5073701wru.67.2020.11.20.05.49.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Nov 2020 05:49:34 -0800 (PST)
Subject: Re: [PATCH for-5.2] Revert "hw/core/qdev-properties: Use
 qemu_strtoul() in set_pci_host_devaddr()"
To: "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org
References: <20201120130409.956956-1-mst@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <474ec544-b0eb-b432-cdac-f80e84ec3138@redhat.com>
Date: Fri, 20 Nov 2020 14:49:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201120130409.956956-1-mst@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Geoffrey McRae <geoff@hostfission.com>, Klaus Herman <kherman@inbox.lv>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/20/20 2:04 PM, Michael S. Tsirkin wrote:
> This reverts commit bccb20c49df1bd683248a366021973901c11982f as it
> introduced a regression blocking bus addresses > 0x1f or higher.
> Legal bus numbers go up to 0xff.
> 
> Cc: "Philippe Mathieu-Daudé" <philmd@redhat.com>
> Fixes: bccb20c49df ("Use qemu_strtoul() in set_pci_host_devaddr()")
> Reported-by: Klaus Herman <kherman@inbox.lv>
> Reported-by: Geoffrey McRae <geoff@hostfission.com>
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> ---
> 
> checkpatch will complain since it does not like strtoul but
> we had it for years so should be ok for 5.2, right?
> 
>  hw/core/qdev-properties-system.c | 25 +++++++++++++------------
>  1 file changed, 13 insertions(+), 12 deletions(-)

Thanks!

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


