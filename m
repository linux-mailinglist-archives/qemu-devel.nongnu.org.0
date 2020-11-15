Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D80992B35B3
	for <lists+qemu-devel@lfdr.de>; Sun, 15 Nov 2020 16:20:14 +0100 (CET)
Received: from localhost ([::1]:32948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1keJp7-0000Jq-Lj
	for lists+qemu-devel@lfdr.de; Sun, 15 Nov 2020 10:20:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1keJng-0008JF-34
 for qemu-devel@nongnu.org; Sun, 15 Nov 2020 10:18:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22226)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1keJnd-0007l6-Ir
 for qemu-devel@nongnu.org; Sun, 15 Nov 2020 10:18:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605453520;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Cadk0dSOvecKCHvyKHGd8Qu60SsUVgGlBBvV3SpCfag=;
 b=gHDbgQ5rfFrHcqqqhDSC9o1p7N62VcMbJYAIKeARLXheKNnZmNHufanEHDGAJukEBnfsZ6
 OWIfuVdxRwHTKEB9gKgxTjx9qUdejqbtfmWq66mc7IJbCiieVxD7KDzDzTwV4oFA0q2mnZ
 yMxtkxJ2O2cS34vpqK4G7deHETRfFQk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-573-XlNX34NfNzCYgJHdeV3B4g-1; Sun, 15 Nov 2020 10:18:36 -0500
X-MC-Unique: XlNX34NfNzCYgJHdeV3B4g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 161AC804752;
 Sun, 15 Nov 2020 15:18:35 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-23.ams2.redhat.com [10.36.112.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F233862A15;
 Sun, 15 Nov 2020 15:18:21 +0000 (UTC)
Subject: Re: [PATCH 3/4] configure: Add a proper check for sys/ioccom.h and
 use it in tpm_ioctl.h
To: Paolo Bonzini <pbonzini@redhat.com>, luoyonggang@gmail.com,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
References: <20201114165137.15379-1-thuth@redhat.com>
 <20201114165137.15379-4-thuth@redhat.com>
 <CAE2XoE9yU4S=N5eQKaY6NHCVFOQPg+WQFiv05SbrtrUUMWmMQg@mail.gmail.com>
 <44c43a8c-2b10-a951-6aaa-813a7db325a2@redhat.com>
 <50de5469-11eb-0ee6-44dc-d5cc67b4f8b6@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <b719707a-0caf-18f6-cb06-862b038c6293@redhat.com>
Date: Sun, 15 Nov 2020 16:18:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <50de5469-11eb-0ee6-44dc-d5cc67b4f8b6@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/15 10:03:07
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Alexander von Gluck IV <kallisti5@unixzen.com>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-level <qemu-devel@nongnu.org>, David CARLIER <devnexen@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 15/11/2020 15.34, Paolo Bonzini wrote:
> On 15/11/20 15:00, Thomas Huth wrote:
>> On 14/11/2020 17.56, 罗勇刚(Yonggang Luo) wrote:
>>> Can we check this in meson.build?
>>
>> That would be nicer, indeed, but I did not spot a place where I could add my
>> code there ... all the other HAVE_xxx_H symbols are added in the configure
>> script.
> 
> There is one similar test, it was split in two:
> 
> has_gettid = cc.has_function('gettid')
> ...
> config_host_data.set('CONFIG_GETTID', has_gettid)
> 
> but there's no particular reason for that.  You can just add
> 
> config_host_data.set('HAVE_SYS_IOCCOM_H', cc.has_headers('sys/ioccom.h'))
> 
> in the config-host.h section of meson.build?.

Thanks, that seems to do the job! I'll send a v2 with that change (and try
to come up with another patch that converts the other header checks from the
configure script to meson).

 Thomas


