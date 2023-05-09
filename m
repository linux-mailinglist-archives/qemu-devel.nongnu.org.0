Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D7346FC23E
	for <lists+qemu-devel@lfdr.de>; Tue,  9 May 2023 11:02:27 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwJE0-0003o9-Sh; Tue, 09 May 2023 05:01:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1pwJDz-0003nh-5F
 for qemu-devel@nongnu.org; Tue, 09 May 2023 05:01:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1pwJDw-0004CG-I4
 for qemu-devel@nongnu.org; Tue, 09 May 2023 05:01:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683622891;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UfP42Mjc1WWX/gAD4vVXKRie9Vu+gTTBukgNA4aZP0I=;
 b=Jm8s99akcFJpvX0h47j3xPc4agAHpMZfXferkm2+V4D+P81bheIWM87mXs1kbIpxghOZpO
 +Q4Wuboi3JAaqqAwbHdiKE1CVgzq51Ob8qNHo6XD+ii66xP1+sW4d0bkqe0c8Fe7mNGcGX
 Plb9V/IXnbasgpiUnPUTz1gRlBrYguM=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-77-IMDwHw5LP3aOcCxPwHP_gg-1; Tue, 09 May 2023 05:01:30 -0400
X-MC-Unique: IMDwHw5LP3aOcCxPwHP_gg-1
Received: by mail-ej1-f71.google.com with SMTP id
 a640c23a62f3a-9663552473fso351191066b.1
 for <qemu-devel@nongnu.org>; Tue, 09 May 2023 02:01:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683622889; x=1686214889;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=UfP42Mjc1WWX/gAD4vVXKRie9Vu+gTTBukgNA4aZP0I=;
 b=W9BddZFjNyqQeZJl6t6F1Li38d6dGo60tdBAdPyIOg2OKvjz+QOqW8f2DfUPV9/1ik
 XFf3/BLyX7fo/3yP4Mg7rYN4WVzI7YvbntL/tMqlmYDHZW+EMbh+9KdOfIAgS/0IGwRQ
 u0wkRJB8TSyECEg66vd53Iropnb/3rApDu6Q3BKu7oWeWTUYeIOvLBIBQXsAGOPLmn12
 iclT6yIq2MQO93QGXwJzej3edbUcYZUi1eJsJcXG1yMOjvxdQN314TN2/T3YgZRi7K4b
 J38D4zoJwB1I0HO1UqKW+2Q2y+4xA8GvO9B726rQfULZOn7GFkWKj7D/53z3CBRM3MtS
 WICA==
X-Gm-Message-State: AC+VfDxBb4EJVdhpSIXA2kae727pS5JY9iiaC44/4NefqtYy8SsD5+yq
 21R24DldaBJN+6g8pGe7hQqBec4eh439IAQ10TsrHKJ8vWRUSOhTy0j0phLtG7iBwg9mJ/MBRZU
 tOsfGvxjFApF1KF8=
X-Received: by 2002:a17:907:a0c:b0:966:2123:e0ca with SMTP id
 bb12-20020a1709070a0c00b009662123e0camr7585163ejc.34.1683622889278; 
 Tue, 09 May 2023 02:01:29 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6kR8uV1h51F5M6R3Hd+b6Jez+nK61PwR2HOGY9rglkx3H0tvZyzuO33NrXoD43gvIhTNtgjg==
X-Received: by 2002:a17:907:a0c:b0:966:2123:e0ca with SMTP id
 bb12-20020a1709070a0c00b009662123e0camr7585141ejc.34.1683622888954; 
 Tue, 09 May 2023 02:01:28 -0700 (PDT)
Received: from ?IPV6:2003:cf:d738:7fbf:bf54:7947:8c4:60ed?
 (p200300cfd7387fbfbf54794708c460ed.dip0.t-ipconnect.de.
 [2003:cf:d738:7fbf:bf54:7947:8c4:60ed])
 by smtp.gmail.com with ESMTPSA id
 h22-20020a1709070b1600b0094f07545d40sm1051041ejl.220.2023.05.09.02.01.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 May 2023 02:01:28 -0700 (PDT)
Message-ID: <c082fe16-6c83-3445-67fc-26da718d5479@redhat.com>
Date: Tue, 9 May 2023 11:01:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 2/4] vhost-user: Interface for migration state transfer
Content-Language: en-US
To: Eugenio Perez Martin <eperezma@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
Cc: Stefan Hajnoczi <stefanha@gmail.com>, qemu-devel@nongnu.org,
 virtio-fs@redhat.com, German Maglione <gmaglione@redhat.com>,
 Anton Kuchin <antonkuchin@yandex-team.ru>,
 Juan Quintela <quintela@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>
References: <20230412210641.GC2813183@fedora>
 <CAJaqyWfm=g_hr9=WpsnwJ4hdpVb7K7p5rirWjvx=PxKYUp8trA@mail.gmail.com>
 <20230417153810.GE3852722@fedora>
 <CAJaqyWePM_a7AafP9qS40hmYXKHDyMsvn5g24zk=cH8L6s-kUw@mail.gmail.com>
 <CAJSP0QWUfxzad3EmT3r1hhaWmXDQt9Nj1LRPhPs_w79S9GAb1A@mail.gmail.com>
 <CAJaqyWfaDVZDJtMvPUhdRE283e80rB3WFd3RF9i=buaBYG=PKA@mail.gmail.com>
 <20230418175924.GB4041499@fedora>
 <CAJaqyWd9Ec7hpfv_NUDxOuwK4weyRTm-cVNOuv8VTiGVzyYjHQ@mail.gmail.com>
 <CAJSP0QWx_9TJa_0QRfhNg6JQemAWCc0ZagvkSxj15bbM5tGD4w@mail.gmail.com>
 <a95c1ad494ce5f8d7f27af788708966e7ba1925a.camel@redhat.com>
 <20230508191235.GA926999@fedora>
 <CAJaqyWdAyVaLJykLEkHwK3BpcvP2RPJQ1ok02F9LRe26QT75Aw@mail.gmail.com>
From: Hanna Czenczek <hreitz@redhat.com>
In-Reply-To: <CAJaqyWdAyVaLJykLEkHwK3BpcvP2RPJQ1ok02F9LRe26QT75Aw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.802, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 09.05.23 08:31, Eugenio Perez Martin wrote:
> On Mon, May 8, 2023 at 9:12 PM Stefan Hajnoczi <stefanha@redhat.com> wrote:

[...]

>> VHOST_USER_GET_VRING_BASE itself isn't really enough because it stops a
>> specific virtqueue but not the whole device. Unfortunately stopping all
>> virtqueues is not the same as SUSPEND since spontaneous device activity
>> is possible independent of any virtqueue (e.g. virtio-scsi events and
>> maybe virtio-net link status).
>>
>> That's why I think SUSPEND is necessary for a solution that's generic
>> enough to cover all device types.
>>
> I agree.
>
> In particular virtiofsd is already resetting all the device at
> VHOST_USER_GET_VRING_BASE if I'm not wrong, so that's even more of a
> reason to implement suspend call.

Oh, no, just the vring in question.  Not the whole device.

In addition, we still need the GET_VRING_BASE call anyway, because, 
well, we want to restore the vring on the destination via SET_VRING_BASE.

Hanna


