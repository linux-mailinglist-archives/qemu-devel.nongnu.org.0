Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B873316534
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 12:29:06 +0100 (CET)
Received: from localhost ([::1]:59978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9ng9-0001XI-Kj
	for lists+qemu-devel@lfdr.de; Wed, 10 Feb 2021 06:29:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1l9nbo-0007ks-9b
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 06:24:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:38082)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1l9nbm-0000Rn-Ib
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 06:24:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612956273;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dkQ38TzJ2Du6a2+CHUfluTFx/K+nEvyUK3OMSUD7zok=;
 b=CMN/iikZP9Q0EcJEJxf72uet5fAnaoRvKkny6n+DN1kIREco/iNWveaStiuth2jWuqJsUR
 MHfYcN/jOM9FFXkrAWG4hAhI5+cGzr2LD946k6Hl3VsXd5QRQHuq/3WnUAhjaEBXiz1zoN
 pUDTGH/1nF6ITvTBnEXhMlqLhPyAxfs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-280-JfpUO2VvN9OE4llCmvJWAQ-1; Wed, 10 Feb 2021 06:24:29 -0500
X-MC-Unique: JfpUO2VvN9OE4llCmvJWAQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 12688107ACFA;
 Wed, 10 Feb 2021 11:24:27 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-121.ams2.redhat.com [10.36.112.121])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D9B446C959;
 Wed, 10 Feb 2021 11:24:00 +0000 (UTC)
Subject: Re: [PATCH v2] hw/block: nvme: Fix a build error in nvme_get_feature()
To: Bin Meng <bmeng.cn@gmail.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@redhat.com>
References: <1612952597-62595-1-git-send-email-bmeng.cn@gmail.com>
 <299d3bdc-268c-eccc-66be-6605b23a2c92@redhat.com>
 <CAEUhbmXaSDauxVaEdBt2yvbAq3_LC6bsHiwF+T6Qgf9mSmcy-w@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <e982a505-fddd-0883-1ab2-13bf188396e3@redhat.com>
Date: Wed, 10 Feb 2021 12:23:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <CAEUhbmXaSDauxVaEdBt2yvbAq3_LC6bsHiwF+T6Qgf9mSmcy-w@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.57,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.265, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 Qemu-block <qemu-block@nongnu.org>, Bin Meng <bin.meng@windriver.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Max Reitz <mreitz@redhat.com>, Klaus Jensen <its@irrelevant.dk>,
 Minwoo Im <minwoo.im.dev@gmail.com>, Keith Busch <kbusch@kernel.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/02/2021 12.15, Bin Meng wrote:
> Hi Philippe,
> 
> On Wed, Feb 10, 2021 at 7:12 PM Philippe Mathieu-Daudé
> <philmd@redhat.com> wrote:
>>
>> Hi Bin,
>>
>> On 2/10/21 11:23 AM, Bin Meng wrote:
>>> From: Bin Meng <bin.meng@windriver.com>
>>>
>>> Current QEMU HEAD nvme.c does not compile:
>>>
>>>    hw/block/nvme.c:3242:9: error: ‘result’ may be used uninitialized in this function [-Werror=maybe-uninitialized]
>>>           trace_pci_nvme_getfeat_vwcache(result ? "enabled" : "disabled");
>>>           ^
>>>    hw/block/nvme.c:3150:14: note: ‘result’ was declared here
>>>       uint32_t result;
>>>                ^
>>
>> Why isn't this catched by our CI? What is your host OS? Fedora 33?
>>
> 
> I am using GCC 5.4 on Ubuntu 16.04. Please see some initial analysis
> from Peter about why newer version GCC does not report it.

Please note that Ubuntu 16.04 is not a supported version by QEMU anymore, 
see https://qemu.readthedocs.io/en/latest/system/build-platforms.html and 
https://wiki.qemu.org/Supported_Build_Platforms for details.

  Thomas


