Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 345FB33D7DF
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 16:43:50 +0100 (CET)
Received: from localhost ([::1]:59914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMBrJ-00036m-94
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 11:43:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58338)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1lMBld-0007QV-UV
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 11:37:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46146)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1lMBlc-0003kH-Ak
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 11:37:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615909075;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=z+w21dNgzcRD+80Z0atoP0wY3i0k6kBBGR5yqynfNiE=;
 b=c+4Ls1B10Wux5x1sov/urgZh3NLFMVM/mkyKWcojLGKhSdGANsrbwOmPJDaCZ5zSjSOoaa
 uOAt1NuiWoQN/TmvcsrLMDWX9BvyhykZF9hI1KdtjImErz1aLf5/p8UkIBqul+diSGHKWa
 5YAJ4irSgVC89RNzzwJadbFiaHpVmd8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-209-FQjfV9u9OS6MmNuYVRJZeQ-1; Tue, 16 Mar 2021 11:37:54 -0400
X-MC-Unique: FQjfV9u9OS6MmNuYVRJZeQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9E828800C78;
 Tue, 16 Mar 2021 15:37:52 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-114-138.ams2.redhat.com
 [10.36.114.138])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8ADE010023B0;
 Tue, 16 Mar 2021 15:37:47 +0000 (UTC)
Subject: Re: [RFC PATCH 5/8] qtest/libqos: Restrict CPU I/O instructions
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210314232913.2607360-1-f4bug@amsat.org>
 <20210314232913.2607360-6-f4bug@amsat.org>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <b1dc01eb-0090-e47e-2731-c1920d9cda42@redhat.com>
Date: Tue, 16 Mar 2021 16:37:46 +0100
MIME-Version: 1.0
In-Reply-To: <20210314232913.2607360-6-f4bug@amsat.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lersek@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=lersek@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

(+Peter, comment below)

On 03/15/21 00:29, Philippe Mathieu-Daudé wrote:
> Restrict CPU I/O instructions to architectures providing
> I/O bus.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  tests/qtest/libqos/fw_cfg.h | 3 +++
>  tests/qtest/libqos/fw_cfg.c | 2 ++
>  2 files changed, 5 insertions(+)
> 
> diff --git a/tests/qtest/libqos/fw_cfg.h b/tests/qtest/libqos/fw_cfg.h
> index c6a7cf8cf05..3bfb6d6d55b 100644
> --- a/tests/qtest/libqos/fw_cfg.h
> +++ b/tests/qtest/libqos/fw_cfg.h
> @@ -36,6 +36,8 @@ size_t qfw_cfg_get_file(QFWCFG *fw_cfg, const char *filename,
>  
>  QFWCFG *mm_fw_cfg_init(QTestState *qts, uint64_t base);
>  void mm_fw_cfg_uninit(QFWCFG *fw_cfg);
> +
> +#ifdef TARGET_HAS_IOPORT
>  QFWCFG *io_fw_cfg_init(QTestState *qts, uint16_t base);
>  void io_fw_cfg_uninit(QFWCFG *fw_cfg);
>  
> @@ -48,6 +50,7 @@ static inline void pc_fw_cfg_uninit(QFWCFG *fw_cfg)
>  {
>      io_fw_cfg_uninit(fw_cfg);
>  }
> +#endif /* TARGET_HAS_IOPORT */
>  
>  G_DEFINE_AUTOPTR_CLEANUP_FUNC(QFWCFG, mm_fw_cfg_uninit)
>  
> diff --git a/tests/qtest/libqos/fw_cfg.c b/tests/qtest/libqos/fw_cfg.c
> index 6b8e1babe51..db2b83f5212 100644
> --- a/tests/qtest/libqos/fw_cfg.c
> +++ b/tests/qtest/libqos/fw_cfg.c
> @@ -131,6 +131,7 @@ void mm_fw_cfg_uninit(QFWCFG *fw_cfg)
>      g_free(fw_cfg);
>  }
>  
> +#ifdef TARGET_HAS_IOPORT
>  static void io_fw_cfg_select(QFWCFG *fw_cfg, uint16_t key)
>  {
>      qtest_outw(fw_cfg->qts, fw_cfg->base, key);
> @@ -162,3 +163,4 @@ void io_fw_cfg_uninit(QFWCFG *fw_cfg)
>  {
>      g_free(fw_cfg);
>  }
> +#endif /* TARGET_HAS_IOPORT */
> 

I'm not sure the macro name is ideal; the PCI host on aarch64/"virt"
emulates IO Ports (it's possible to allocate PCI IO resources on
"virt"). From patch#3, TARGET_HAS_IOPORT does not seem to extend to arm64.

I guess the intent is OK in both patches #3 and #5.

Thanks
Laszlo


