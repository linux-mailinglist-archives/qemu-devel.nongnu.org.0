Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CDDAC4E60CE
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Mar 2022 10:03:47 +0100 (CET)
Received: from localhost ([::1]:35988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXJNi-0008OI-O9
	for lists+qemu-devel@lfdr.de; Thu, 24 Mar 2022 05:03:46 -0400
Received: from eggs.gnu.org ([209.51.188.92]:59072)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nXJDt-0000Mt-Op
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 04:53:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40049)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nXJDq-0003nv-Oj
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 04:53:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648112013;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IJbIkl3tOBYBOsFF1RkaEbz4ogjAna9YQQVV57sAQkA=;
 b=OJzempDXtenO9wuNpO1m7k+qRqT4cbjbty65qRDLgfKlJpW3m5sLktp/UUnQHc8bzRhbKV
 lQdhqQiHJvX0LDJ1kik+w0GUTG0KAf9js+Y55vgVA3cn+NXOhCmwyvkPQAS1fQrPkUIOZf
 vEoZKq+NKm+rVKyD0A4lW2KLIrEk6q8=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-588-9nIOWJdqMDeqxHmDcDzsFw-1; Thu, 24 Mar 2022 04:53:29 -0400
X-MC-Unique: 9nIOWJdqMDeqxHmDcDzsFw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3D2FD28078E1;
 Thu, 24 Mar 2022 08:53:29 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.80])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E457D2024CB6;
 Thu, 24 Mar 2022 08:52:41 +0000 (UTC)
Date: Thu, 24 Mar 2022 08:52:39 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Xiaoyao Li <xiaoyao.li@intel.com>
Subject: Re: [RFC PATCH v3 17/36] pflash_cfi01/tdx: Introduce ram_mode of
 pflash for TDVF
Message-ID: <YjwxV6++RxdpXt6M@redhat.com>
References: <20220317135913.2166202-1-xiaoyao.li@intel.com>
 <20220317135913.2166202-18-xiaoyao.li@intel.com>
 <f418548e-c24c-1bc3-4e16-d7a775298a18@gmail.com>
 <7a8233e4-0cae-b05a-7931-695a7ee87fc9@intel.com>
 <20220322092141.qsgv3pqlvlemgrgw@sirius.home.kraxel.org>
 <YjmXFZRCbKXTkAhN@redhat.com>
 <e7fb2eab-b2b1-dd0e-4821-4cca40751d15@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e7fb2eab-b2b1-dd0e-4821-4cca40751d15@intel.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: isaku.yamahata@intel.com, Marcelo Tosatti <mtosatti@redhat.com>,
 kvm@vger.kernel.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Connor Kuehl <ckuehl@redhat.com>, Eric Blake <eblake@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philippe.mathieu.daude@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>, seanjc@google.com, erdemaktas@google.com,
 Paolo Bonzini <pbonzini@redhat.com>, Laszlo Ersek <lersek@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Mar 24, 2022 at 02:13:53PM +0800, Xiaoyao Li wrote:
> On 3/22/2022 5:29 PM, Daniel P. Berrangé wrote:
> > On Tue, Mar 22, 2022 at 10:21:41AM +0100, Gerd Hoffmann wrote:
> > >    Hi,
> > > 
> > > > > If you don't need a pflash device, don't use it: simply map your nvram
> > > > > region as ram in your machine. No need to clutter the pflash model like
> > > > > that.
> > > 
> > > Using the pflash device for something which isn't actually flash looks a
> > > bit silly indeed.
> > > 
> > > > 
> > > > I know it's dirty to hack the pflash device. The purpose is to make the user
> > > > interface unchanged that people can still use
> > > > 
> > > > 	-drive if=pflash,format=raw,unit=0,file=/path/to/OVMF_CODE.fd
> > > >          -drive if=pflash,format=raw,unit=1,file=/path/to/OVMF_VARS.fd
> > > > 
> > > > to create TD guest.
> > > 
> > > Well, if persistent vars are not supported anyway there is little reason
> > > to split the firmware into CODE and VARS files.  You can use just use
> > > OVMF.fd with a single pflash device.  libvirt recently got support for
> > > that.
> > 
> > Agreed.
> 
> The purpose of using split firmware is that people can share the same
> code.fd while using different vars.fd

That's fine for firmware that writes to vars.fd, but it was said earlier
that changes aren't written with TDX (nor are they written with SEV),
so a separate vars.fd serves no pupose in these cases.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


