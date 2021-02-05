Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9D83310EA6
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 18:28:02 +0100 (CET)
Received: from localhost ([::1]:36660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l84tl-0000UP-VY
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 12:28:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1l84MH-0007Xm-35
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 11:53:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:54807)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1l84MD-0000mG-HK
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 11:53:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612544000;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cEQV38RuXOBT5qtMbIO3pqGjZLQvIiszwpYGRSTydP4=;
 b=bvDb7XbVGuPxh63pKH0vSz3u0E4zzi22RWez/J4zI3eI+Rl5CYWpdC5nH98RymE5d1Ks+m
 TgAiEYMFGBQ6H8S9oL4MQyKWB9bo5Dcqpwbb0emjZIhSwVqctweWxYt6o+qSr0oc2YG5Op
 BAyJeIQnG87uONLW4GfR48sYbivYtXY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-52-ymbyoHGMNvu68T-cD6JT0w-1; Fri, 05 Feb 2021 11:53:16 -0500
X-MC-Unique: ymbyoHGMNvu68T-cD6JT0w-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B0BC5107ACE4;
 Fri,  5 Feb 2021 16:53:14 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-46.ams2.redhat.com [10.36.112.46])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BB8EC5C257;
 Fri,  5 Feb 2021 16:53:00 +0000 (UTC)
Subject: Re: [PULL v2 00/27] Block patches
To: Peter Maydell <peter.maydell@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>
References: <20210204154327.386529-1-stefanha@redhat.com>
 <CAFEAcA9krQPfgzLSEimNdN7dUQJbqUObGtoiK7A9ZOGKxanR+g@mail.gmail.com>
 <20210205162105.GB416527@stefanha-x1.localdomain>
 <CAFEAcA-VFfcWzH47nxgthtcdkCzm8c74uo3rj8Zd=M3mWAXX7g@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <4b05dea5-be2e-1da1-30bb-ade792ec75cd@redhat.com>
Date: Fri, 5 Feb 2021 17:52:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-VFfcWzH47nxgthtcdkCzm8c74uo3rj8Zd=M3mWAXX7g@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.352,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.33, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 John G Johnson <john.g.johnson@oracle.com>,
 Jagannathan Raman <jag.raman@oracle.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Qemu-block <qemu-block@nongnu.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, "Denis V. Lunev" <den@openvz.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Fam Zheng <fam@euphon.net>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 05/02/2021 17.23, Peter Maydell wrote:
> On Fri, 5 Feb 2021 at 16:21, Stefan Hajnoczi <stefanha@redhat.com> wrote:
>> Thanks, I update the patch in question.
>>
>> It looks like the GitLab CI doesn't include a clang version that
>> produces this error because the pipeline passed for me:
>> https://gitlab.com/stefanha/qemu/-/pipelines/251524779
>>
>> Is there something clang-specific you want to check in the CI? Maybe
>> clang 3.4, the oldest version supported according to ./configure?
> 
> Would probably be nice I guess. My ad-hoc builds use clang 6,
> which is what tripped up here.

We should maybe discuss first whether we can bump the minimum version of 
Clang that we would like to support. I once picked Clang 3.4 since that was 
available in EPEL for RHEL7, but I think there were newer versions of Clang 
available in RHEL7 via other repos later, so 3.4 is likely really just way 
too old now...

According to https://developers.redhat.com/HW/ClangLLVM-RHEL-7 there was at 
least Clang 7.0 available on RHEL7. Debian stable seems to have at least 
7.0, too, according to repology.org. Ubuntu 18.04 seems to have version 6, 
but later ones are available via updates? Anyway, I think we could at least 
bump the minimum version to 6.0 nowadays...

  Thomas


