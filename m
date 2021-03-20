Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6923A342AA2
	for <lists+qemu-devel@lfdr.de>; Sat, 20 Mar 2021 06:08:53 +0100 (CET)
Received: from localhost ([::1]:47598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lNTr1-0004ZS-TI
	for lists+qemu-devel@lfdr.de; Sat, 20 Mar 2021 01:08:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lNTpY-00045H-23
 for qemu-devel@nongnu.org; Sat, 20 Mar 2021 01:07:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:44412)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lNTpS-0005c1-J6
 for qemu-devel@nongnu.org; Sat, 20 Mar 2021 01:07:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616216832;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bI8UStCA9HY8XKJbPZu5vUc6pOHdZrOF4U0hQJgDDKo=;
 b=dzILfsM1fNRRAA2wIILAFpIIXaEGQKaujXueCQqvi8/tR3V57ViaqkFVVejTm0vZ9+fFnl
 k4Y0BAxdIY+CQ78iLUUv0PYMZ+ZIW/2scGK3DIQRlkzjiPDsNxAJzulC/GAVqpcDjHnOHT
 k6gkNtNRrAZN0/0q+ujj/3rJN4ATPtc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-344-kuV1bJs3M1G9aQta0xLHqg-1; Sat, 20 Mar 2021 01:07:10 -0400
X-MC-Unique: kuV1bJs3M1G9aQta0xLHqg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8CFE2800D53;
 Sat, 20 Mar 2021 05:07:09 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-13.ams2.redhat.com [10.36.112.13])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8736D5D6D5;
 Sat, 20 Mar 2021 05:07:06 +0000 (UTC)
Subject: Re: [PATCH v3 6/6] iotests: iothreads need ioeventfd
To: Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
References: <20210319202335.2397060-1-laurent@vivier.eu>
 <20210319202335.2397060-7-laurent@vivier.eu>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <d639e327-8320-ee3a-6207-5d77846362aa@redhat.com>
Date: Sat, 20 Mar 2021 06:07:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210319202335.2397060-7-laurent@vivier.eu>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Cornelia Huck <cohuck@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Max Reitz <mreitz@redhat.com>, qemu-s390x@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 19/03/2021 21.23, Laurent Vivier wrote:
> And ioeventfd are only available with virtio-scsi-pci or virtio-scsi-ccw,
> use the alias but add a rule to require virtio-scsi-pci or virtio-scsi-ccw
> for the tests that use iothreads.
> 
> Signed-off-by: Laurent Vivier <laurent@vivier.eu>
> ---
>   tests/qemu-iotests/127        |  3 ++-
>   tests/qemu-iotests/256        |  6 ++++--
>   tests/qemu-iotests/common.rc  | 13 +++++++++++++
>   tests/qemu-iotests/iotests.py |  5 +++++
>   4 files changed, 24 insertions(+), 3 deletions(-)

Reviewed-by: Thomas Huth <thuth@redhat.com>


