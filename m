Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 448766FE2B0
	for <lists+qemu-devel@lfdr.de>; Wed, 10 May 2023 18:43:38 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwmtj-0007Oe-Sa; Wed, 10 May 2023 12:42:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pwmth-0007OG-Vv
 for qemu-devel@nongnu.org; Wed, 10 May 2023 12:42:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pwmtf-0006m3-Ji
 for qemu-devel@nongnu.org; Wed, 10 May 2023 12:42:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683736954;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JCWS35BNbdz6JknXcEiBoSSgfXIHh/MQau4KaH5dpT8=;
 b=ZbB81TEMTcHgAcVwXTG9AcfoPgL6T+bK+L0ka9ZB9MlW1/wtGW7WQYfndJhOe8GiPhCj/y
 c1UaYTweek+gwjyqTBRkcU60Bsp+2HwGIoLnuEVxJM2ZwgnBlIVYsaiQqZ6MdRsRHzvRYR
 hEjwRmrYSlMR6/rOMpSlbzLmsz3hBJI=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-661-zyGjoOVJMZaNecNQdbeAbQ-1; Wed, 10 May 2023 12:42:30 -0400
X-MC-Unique: zyGjoOVJMZaNecNQdbeAbQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-307977ae703so2340422f8f.3
 for <qemu-devel@nongnu.org>; Wed, 10 May 2023 09:42:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683736950; x=1686328950;
 h=content-transfer-encoding:mime-version:message-id:date:reply-to
 :user-agent:references:in-reply-to:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JCWS35BNbdz6JknXcEiBoSSgfXIHh/MQau4KaH5dpT8=;
 b=kE/sJ2dQp4jmSDfGSevBmemho31WjiVz2JFOssGLnxm9GRukPRb6W65doHsrt+5NlR
 cOxnzrG9ygYiTa7cQXiKxD7iUZ3/HfIecFJP1PVrEDCgC7t1JmJhfjd3YrF5n8JnmoIN
 MBUJs21fWizq1dJmHV2HiQxoi4xgNFgTPapPznlfaow1dAzHL7JlM4+LYL5ouRtuOZ4o
 swl9A7vA7HZiYhVUr9ppYrP0lDshscfUsUivu0IiaA4a2v20fZDwVE9/42rXQMpSe1P1
 fr3/NeBwhMeBJmb2/Co1ADl/AtLl3ozGRZkWvYfYxH5le4cTT4gQe2olrAvC3mmsmLUe
 a5sg==
X-Gm-Message-State: AC+VfDzmVnAYgf/LhMlaHBoK8yhKVLC2PC27vrIIiEEYq7FTB8fWyG4j
 +Pg8r5mOa31A86k8PjzgE2zaZ6WfhdD6+oxLMK6pliW5uNLZ2Pen+fk9ze11ygi0cgqnAEPp37q
 e5Bcp0o3I4/t/xcs=
X-Received: by 2002:adf:f045:0:b0:304:8147:f0ba with SMTP id
 t5-20020adff045000000b003048147f0bamr12595796wro.3.1683736949798; 
 Wed, 10 May 2023 09:42:29 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ40uIjIEP2Jdsw9gKzIhqpfyEaDwCsn+0gBxZqXdPYJnuf3OZO7wW9N/KWhnzh9Kg1+jmREKg==
X-Received: by 2002:adf:f045:0:b0:304:8147:f0ba with SMTP id
 t5-20020adff045000000b003048147f0bamr12595784wro.3.1683736949518; 
 Wed, 10 May 2023 09:42:29 -0700 (PDT)
Received: from redhat.com (static-92-120-85-188.ipcom.comunitel.net.
 [188.85.120.92]) by smtp.gmail.com with ESMTPSA id
 c6-20020adfef46000000b003047dc162f7sm17706533wrp.67.2023.05.10.09.42.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 May 2023 09:42:28 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Cc: Leonardo Bras <leobras@redhat.com>,  Eduardo Habkost
 <eduardo@habkost.net>,  Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,  Yanan Wang
 <wangyanan55@huawei.com>,  "Michael S. Tsirkin" <mst@redhat.com>,  Peter
 Xu <peterx@redhat.com>,  qemu-devel@nongnu.org
Subject: Re: [PATCH v1 1/1] hw/pci: Disable PCI_ERR_UNCOR_MASK register for
 machine type < 8.0
In-Reply-To: <aab782f3-5639-d7fc-5886-5deda5a18759@msgid.tls.msk.ru> (Michael
 Tokarev's message of "Wed, 10 May 2023 19:29:40 +0300")
References: <20230503002701.854329-1-leobras@redhat.com>
 <aab782f3-5639-d7fc-5886-5deda5a18759@msgid.tls.msk.ru>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Wed, 10 May 2023 18:42:28 +0200
Message-ID: <87fs846suj.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Reply-To: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Michael Tokarev <mjt@tls.msk.ru> wrote:
> 03.05.2023 03:27, Leonardo Bras =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>> Since it's implementation on v8.0.0-rc0, having the PCI_ERR_UNCOR_MASK
>> set for machine types < 8.0 will cause migration to fail if the target
>> QEMU version is < 8.0.0 :
>> qemu-system-x86_64: get_pci_config_device: Bad config data: i=3D0x10a
>> read: 40 device: 0 cmask: ff wmask: 0 w1cmask:0
>> qemu-system-x86_64: Failed to load PCIDevice:config
>> qemu-system-x86_64: Failed to load e1000e:parent_obj
>> qemu-system-x86_64: error while loading state for instance 0x0 of device=
 '0000:00:02.0/e1000e'
>> qemu-system-x86_64: load of migration failed: Invalid argument
>> The above test migrated a 7.2 machine type from QEMU master to QEMU
>> 7.2.0,
>> with this cmdline:
>> ./qemu-system-x86_64 -M pc-q35-7.2 [-incoming XXX]
>> In order to fix this, property x-pcie-err-unc-mask was introduced to
>> control when PCI_ERR_UNCOR_MASK is enabled. This property is enabled by
>> default, but is disabled if machine type <=3D 7.2.
>> Fixes: 010746ae1d ("hw/pci/aer: Implement PCI_ERR_UNCOR_MASK
>> register")
>> Suggested-by: Michael S. Tsirkin <mst@redhat.com>
>> Signed-off-by: Leonardo Bras <leobras@redhat.com>
>
> It looks like 8.0-stable material to me, is it not?

It is .

I thought we have already requested that.  We lost the intent somewhere,
sorry.

Later, Juan.


