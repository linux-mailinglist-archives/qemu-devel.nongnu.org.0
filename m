Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EDBBB4428BC
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 08:41:15 +0100 (CET)
Received: from localhost ([::1]:44312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhoPz-00032k-4Z
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 03:41:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mhoOZ-00028d-EW
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 03:39:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:42936)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mhoOX-0000dd-BR
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 03:39:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635838781;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iYJ+rzPHjNuYUW6zXStopClVVMx1ShvzWhMFsee97fE=;
 b=iGEbYaf/cXKiuvYWLuwkJjj1z7/F2+1vhYl3bs1pEkM3eN9yuMj8b7suMMkN5lIwV1ekru
 F2aNiytjO1M8okiQ0hMi//e9oDAqq9FW3l2TUOcgCzjXFpdXIWVIySI0+XQQwnssU9zQ5K
 RxvRwdD7Vk2ayadSJq0cI+SynINKaK8=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-189-ft7f9AdvN4iotTNSUfzbEg-1; Tue, 02 Nov 2021 03:39:40 -0400
X-MC-Unique: ft7f9AdvN4iotTNSUfzbEg-1
Received: by mail-wm1-f69.google.com with SMTP id
 y9-20020a1c7d09000000b003316e18949bso3747840wmc.5
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 00:39:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rvM+Poc8HmK0BbG3MONenb/GbOeLn0E+m/VzqR43GaU=;
 b=yOpasLXpG2UymS6ikq5EdNz8wVyoQS3IFySZlr0Jr2tyJsutRxrIGaNsfBGfNvizDC
 4uDOrGXDlCBXkdptcvVL+1o2ReD0+W3KwJuTln4ohCQWcBkUGCmNfJjut2VU/3dux2lv
 tkh9hCp11D0CQCPibMr/Tb3EiDYBUVBisJQXrw57dXnTdV750V1cRXv8N3ugMF/sXHEN
 XvF/n0W9KDpp1di5lF/JtDBLm2RSYrPWHIV4lsyXTmdO/E3SOBuvBehixZACREkf6LLm
 ihU6yp9CV11RoBt9Tmh9AcMatMVercSQQWVxPhcu4Ph0ld7wdbMAoADntYaIgfchgjut
 6zSw==
X-Gm-Message-State: AOAM533X1L/mtTfR8g0yktG21xx4toCKY2EKzyxhOfG1dBQRpc3Mh+EH
 v/DSv3LE8j3WPnGrPSZKGO9cdDtm2ToVUr8/1Goz0JpehnVcPgr/SibGaEViyjX5Vdm0C/m4mzZ
 ff3A0TtnxOwlmlnI=
X-Received: by 2002:a5d:5144:: with SMTP id u4mr38439771wrt.91.1635838779357; 
 Tue, 02 Nov 2021 00:39:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxy+z3nFQGpQaDjuMoiWl0dWnpUbkeD+0o1Qxrj5xdUgGO0aNAPyIJ6uswMVBNtDdR+HtpFSg==
X-Received: by 2002:a5d:5144:: with SMTP id u4mr38439734wrt.91.1635838779151; 
 Tue, 02 Nov 2021 00:39:39 -0700 (PDT)
Received: from localhost ([188.26.219.88])
 by smtp.gmail.com with ESMTPSA id e12sm535754wrq.20.2021.11.02.00.39.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 00:39:38 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [RFC PATCH v5 02/26] vhost: Fix last queue index of devices
 with no cvq
In-Reply-To: <20211102033023-mutt-send-email-mst@kernel.org> (Michael
 S. Tsirkin's message of "Tue, 2 Nov 2021 03:32:32 -0400")
References: <20211029183525.1776416-1-eperezma@redhat.com>
 <20211029183525.1776416-3-eperezma@redhat.com>
 <87a6inow7s.fsf@secure.mitica>
 <20211102033023-mutt-send-email-mst@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
Date: Tue, 02 Nov 2021 08:39:37 +0100
Message-ID: <87v91bngzq.fsf@secure.mitica>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.734,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Jason Wang <jasowang@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Eugenio =?utf-8?Q?P=C3=A9rez?= <eperezma@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Eli Cohen <eli@mellanox.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>,
 Eric Blake <eblake@redhat.com>, virtualization@lists.linux-foundation.org,
 Parav Pandit <parav@mellanox.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

"Michael S. Tsirkin" <mst@redhat.com> wrote:
> On Tue, Nov 02, 2021 at 08:25:27AM +0100, Juan Quintela wrote:
>> Eugenio P=C3=A9rez <eperezma@redhat.com> wrote:
>> > The -1 assumes that all devices with no cvq have an spare vq allocated
>> > for them, but with no offer of VIRTIO_NET_F_CTRL_VQ. This may not be t=
he
>> > case, and the device may have a pair number of queues.
>>                                   ^^^^
>> even
>>=20
>> I know, I know, I am Spanish myself O:-)
>
> Nobody expects the Spanish ;)

O:-)

>> int main(void)
>> {
>> =09int i =3D 7;
>> =09i &=3D -1ULL;
>
> Stefano's patch has ~1ULL , not -1ULL here.
>

Stupid eyes.

Thanks, Juan.


