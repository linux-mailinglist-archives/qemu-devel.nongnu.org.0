Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F91B51F952
	for <lists+qemu-devel@lfdr.de>; Mon,  9 May 2022 12:07:12 +0200 (CEST)
Received: from localhost ([::1]:47332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1no0IJ-0002HF-Hu
	for lists+qemu-devel@lfdr.de; Mon, 09 May 2022 06:07:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1no0Ff-0008QZ-Lu
 for qemu-devel@nongnu.org; Mon, 09 May 2022 06:04:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44195)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1no0Fa-0006is-Os
 for qemu-devel@nongnu.org; Mon, 09 May 2022 06:04:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652090660;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fSppE/+ysLtskg9Wot+tcQrM3tIQycgLFGRGpQ8hBPY=;
 b=Rs+71S5Wk6O11jyCFBaPdavRKpRRdroAwC8FRTvf4jbxaj5u9FI9UKAadCh/6CWbxFQ1ZM
 J0GfIM/7q5Zj337W9IrBeDJbTCXya+D3IkNeu5eHYjstwQ6We8qZEUECJIufEajcJOUzyQ
 GQo2yPEgr+VldOFiB7l4Sn7GHMqmD54=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-68-7fQ-05ghNc-Uoc0PgmpeHA-1; Mon, 09 May 2022 06:04:14 -0400
X-MC-Unique: 7fQ-05ghNc-Uoc0PgmpeHA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F09CA811E80;
 Mon,  9 May 2022 10:04:13 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.13])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B04801467E5B;
 Mon,  9 May 2022 10:04:13 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 9BAC0180062C; Mon,  9 May 2022 12:04:11 +0200 (CEST)
Date: Mon, 9 May 2022 12:04:11 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Stefan Hajnoczi <stefanha@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel@nongnu.org, Gautam Agrawal <gutamnagrawal@gmail.com>
Subject: Re: [PATCH v3] Warn user if the vga flag is passed but no vga device
 is created
Message-ID: <20220509100411.54lm5hos2rsgzxz4@sirius.home.kraxel.org>
References: <20220501122505.29202-1-gautamnagrawal@gmail.com>
 <YnUvpsaM0hwUSZvM@stefanha-x1.localdomain>
 <b16d2b2d-f086-636b-4da5-79d3134a4482@redhat.com>
 <CAFEAcA9rK6T03mkUrojf+Wz=UCiakibXtj56W0F=uuEjeqoZig@mail.gmail.com>
 <7551dedd-7417-6292-907b-28ff8304cd83@redhat.com>
 <CAFEAcA8i5t0i61HT0NEV5BHYEkK_ipSAeNGuc+3Zg3uqTGkzYQ@mail.gmail.com>
 <b754d9a3-1762-71d2-417a-3c61ae87f3de@redhat.com>
 <CAFEAcA9VaYjMCXUuRk0B-Me6kNApmDcLiwnsNa1eH2WN71Jmjw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA9VaYjMCXUuRk0B-Me6kNApmDcLiwnsNa1eH2WN71Jmjw@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
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

  Hi,

> Oh, I see now -- qemu_disable_default_devices() does a
> preliminary scan through of every supplied -device option,
> looking to see if it has a driver=foo that matches some
> value in the default_list[] array; if it does then we
> set default_vga or whatever to false. (So effectively we
> have a hardcoded list of things we consider to be "VGA
> devices" for this purpose, which might or might not be the same
> as the set of actual VGA devices we support...)
> 
> I guess this is all here for backwards compatibility purposes?

Well, sort of.  This tries to deal with the messy side effects of
the default devices, i.e. avoid users end up with *two* vga devices
in case they use "qemu -device VGA" (same for serial, ...).

take care,
  Gerd


