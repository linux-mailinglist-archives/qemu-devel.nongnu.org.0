Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06586578428
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jul 2022 15:46:04 +0200 (CEST)
Received: from localhost ([::1]:50986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDR4V-0001RC-5A
	for lists+qemu-devel@lfdr.de; Mon, 18 Jul 2022 09:46:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1oDQzv-0004NU-LM
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 09:41:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:20375)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1oDQzt-0000I6-3V
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 09:41:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658151676;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dJiOsiJRtiGjTDF7wfg41DpQFwZ5usznU4BxRv5fxlI=;
 b=A5RYS6NeKceg485RDW6+CTILT0V3Z5aeBsMQYJ2CZOMoJrt7ymmpqa1Nnps6kByNgM4nvu
 hWKRhO+fbfDfa9qX228aiqHGjVWKQmlGVVsBbkMhuzMALjJpbTznvnp887FxzL9DRxRmkI
 +BkytNrG2iFlpZs9ID/CroAd5lNL6iM=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-607-XYQFEGVZN-OO-jhUkfykmA-1; Mon, 18 Jul 2022 09:41:14 -0400
X-MC-Unique: XYQFEGVZN-OO-jhUkfykmA-1
Received: by mail-ej1-f71.google.com with SMTP id
 oz11-20020a1709077d8b00b0072f2f17c267so378160ejc.16
 for <qemu-devel@nongnu.org>; Mon, 18 Jul 2022 06:41:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dJiOsiJRtiGjTDF7wfg41DpQFwZ5usznU4BxRv5fxlI=;
 b=pnQQGW6c4F3yxPzz875mnaYPqxQJJfEhyVhiG1qcJVHYvZ0UasYDGX6fIQVLl0y1nJ
 P2Oavau0e7Rbqiwu03M5J9/wfEUxxHZAGNMs6rImrvsQaEooCRhVxw4jMqJPFec79Xsb
 prPjeWMj/3PXjCgmiaIyJys+9DN/jGkXJp41YsIIzL4w+4i7DZXFhGqxs8tskRDo3zTz
 bnmEddfyuoa9A0BWEWQ2OPbowZi4qeoGj8Bi3gJNYbUV0hdIwqI57F+IXXSlCs2aUScF
 ZKEWnoMgmIdpwyT/fWCoAmSwZu2z/oNiM/sPcGfz00zljLcP7wlIvBNNyHtzqqyyykjl
 Hx8w==
X-Gm-Message-State: AJIora8Q7eUXtkd0UYc7H3uQiHkZ2DZxuwrhfYai+f9Z5gGEe6I+4m0S
 UANHPIKMj2jrwmvC4Z7Pig893VEkdwm/vzWzL6RnWKzy6ibpCn5IYuXsJ+c8vZ0OVbyoBz+nCb0
 vuTRKB3RgsK24TNA=
X-Received: by 2002:a17:906:5a61:b0:72b:1468:7fac with SMTP id
 my33-20020a1709065a6100b0072b14687facmr25275890ejc.440.1658151673595; 
 Mon, 18 Jul 2022 06:41:13 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1scblY7l3JKXwgqQUljRDTyDTX17KQShd4e4bT1cBHoQtecUwNUpcRdUukVv7bpH13ZMDv4Vg==
X-Received: by 2002:a17:906:5a61:b0:72b:1468:7fac with SMTP id
 my33-20020a1709065a6100b0072b14687facmr25275876ejc.440.1658151673398; 
 Mon, 18 Jul 2022 06:41:13 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 h5-20020a1709067cc500b00726e108b566sm5549556ejp.173.2022.07.18.06.41.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Jul 2022 06:41:12 -0700 (PDT)
Date: Mon, 18 Jul 2022 15:41:11 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Robert Hoo <robert.hu@linux.intel.com>
Cc: mst@redhat.com, xiaoguangrong.eric@gmail.com, qemu-devel@nongnu.org,
 robert.hu@intel.com, Jingqi Liu <jingqi.liu@intel.com>
Subject: Re: [PATCH] acpi/nvdimm: Define trace events for NVDIMM and
 substitute nvdimm_debug()
Message-ID: <20220718154111.175e92b6@redhat.com>
In-Reply-To: <c1f857fab3b2dd1e58c0fe7ca087f8c742f2aff2.camel@linux.intel.com>
References: <20220704085852.330005-1-robert.hu@linux.intel.com>
 <20220707112101.259acc3a@redhat.com>
 <c1f857fab3b2dd1e58c0fe7ca087f8c742f2aff2.camel@linux.intel.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 18 Jul 2022 15:12:03 +0800
Robert Hoo <robert.hu@linux.intel.com> wrote:
[...]
> BTW, during the unit test, I met some bios-table test error, 
> https://gitlab.com/qemu-project/qemu/-/issues/1098, perhaps related to
> your patches in June.
> https://patchwork.kernel.org/project/qemu-devel/cover/20220608135340.3304695-1-imammedo@redhat.com/

current master works for me.
can you try a clean build?


