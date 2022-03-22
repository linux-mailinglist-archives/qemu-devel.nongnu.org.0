Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 131E84E3BB5
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Mar 2022 10:24:32 +0100 (CET)
Received: from localhost ([::1]:49776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWakg-0002T2-ST
	for lists+qemu-devel@lfdr.de; Tue, 22 Mar 2022 05:24:30 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44720)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1nWai7-0000sR-OA
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 05:21:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56014)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1nWai4-0006xc-M1
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 05:21:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647940907;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PLjmx8OLW7KeMeJFEsvEqIzowx6Q041tGmSK/q4PNms=;
 b=PstnK734ZLLIRbfsPUh4akhgbVwFcpgj7SmHlATGh9Qo7pzS4F0aQdkNb5ZKZuBMTpvANk
 vgWV13RI7f9v3yXkJ+7kReMdoQoMe+Whf2jqK9LVE1wbnXFSBz27mi+zSqI28GAB++OdX0
 d5REcpSmPTyUDOZ0WlHbQ1B4kUTmqI0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-328-05kxP3SyPHqfRVK0F0Ky1g-1; Tue, 22 Mar 2022 05:21:44 -0400
X-MC-Unique: 05kxP3SyPHqfRVK0F0Ky1g-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8BD5E100B8EA;
 Tue, 22 Mar 2022 09:21:43 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.196.67])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 44DB954EC6D;
 Tue, 22 Mar 2022 09:21:43 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id C41FC180062E; Tue, 22 Mar 2022 10:21:41 +0100 (CET)
Date: Tue, 22 Mar 2022 10:21:41 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Xiaoyao Li <xiaoyao.li@intel.com>
Subject: Re: [RFC PATCH v3 17/36] pflash_cfi01/tdx: Introduce ram_mode of
 pflash for TDVF
Message-ID: <20220322092141.qsgv3pqlvlemgrgw@sirius.home.kraxel.org>
References: <20220317135913.2166202-1-xiaoyao.li@intel.com>
 <20220317135913.2166202-18-xiaoyao.li@intel.com>
 <f418548e-c24c-1bc3-4e16-d7a775298a18@gmail.com>
 <7a8233e4-0cae-b05a-7931-695a7ee87fc9@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7a8233e4-0cae-b05a-7931-695a7ee87fc9@intel.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: isaku.yamahata@intel.com, Marcelo Tosatti <mtosatti@redhat.com>,
 Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>, kvm@vger.kernel.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Connor Kuehl <ckuehl@redhat.com>,
 Eric Blake <eblake@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philippe.mathieu.daude@gmail.com>,
 seanjc@google.com, erdemaktas@google.com, Paolo Bonzini <pbonzini@redhat.com>,
 Laszlo Ersek <lersek@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  Hi,

> > If you don't need a pflash device, don't use it: simply map your nvram
> > region as ram in your machine. No need to clutter the pflash model like
> > that.

Using the pflash device for something which isn't actually flash looks a
bit silly indeed.

> 
> I know it's dirty to hack the pflash device. The purpose is to make the user
> interface unchanged that people can still use
> 
> 	-drive if=pflash,format=raw,unit=0,file=/path/to/OVMF_CODE.fd
>         -drive if=pflash,format=raw,unit=1,file=/path/to/OVMF_VARS.fd
> 
> to create TD guest.

Well, if persistent vars are not supported anyway there is little reason
to split the firmware into CODE and VARS files.  You can use just use
OVMF.fd with a single pflash device.  libvirt recently got support for
that.

Just using -bios OVMF.fd might work too.  Daniel tried that recently for
sev, but ran into problems with wiring up ovmf metadata parsing for
-bios.  Don't remember the details though.

take care,
  Gerd


