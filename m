Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B5C43E5985
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Aug 2021 13:57:37 +0200 (CEST)
Received: from localhost ([::1]:44782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDQO0-0004t7-3w
	for lists+qemu-devel@lfdr.de; Tue, 10 Aug 2021 07:57:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48532)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mDQMw-0003Tx-PJ
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 07:56:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54922)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mDQMv-0000jm-C2
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 07:56:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628596588;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=5prZoq1EHeBQ/qRgX1Thye/qV/0NuiVmEZKhrkN0qZM=;
 b=bCFSrkJVEIe1lBcKF5IM7LKiRiwt970pzG0kK5ahHQ6NeT7PQZzw/lNywi1Q+aWGslOBVo
 6qZeuIgq2WCaBGyz/qQAk335jbu7gvI4YLZzxb3YBY9aRk8GM+M7/RUdA6IyMTT0GF0s7Z
 KquoZSulNB1iwHBgHjLHuV8/3M+PHTA=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-16-ZpdYqXtmNDqU1VOoUQvv8g-1; Tue, 10 Aug 2021 07:56:27 -0400
X-MC-Unique: ZpdYqXtmNDqU1VOoUQvv8g-1
Received: by mail-wr1-f71.google.com with SMTP id
 m5-20020a5d6a050000b0290154e83dce73so2057634wru.19
 for <qemu-devel@nongnu.org>; Tue, 10 Aug 2021 04:56:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version;
 bh=5prZoq1EHeBQ/qRgX1Thye/qV/0NuiVmEZKhrkN0qZM=;
 b=ncioi30f9AppqNfd2FflKPwoCsJyAdD0l1egL17bd5QTWkiZtQQ+khVHi6FMWPj4Ws
 yAA2svIKZU0iYIUmZ0DwhmVkVzxRGLwjoNshbCMth/y7oo14g9HE0+Fv+x/9wHFEEcZy
 0KhvJwanxSv/qyzA/Xw54417ffsdzvudNtg9qbJVBQrzHiBydL4uYU+Gykwbm7jGEk3v
 /oUl6BIwoGYRcux7qToluuZXYk/zWuKyytKmz3IhaceETO3AFDj9yCyI24tiWAM0eYIO
 mk+kr+uVbmhKiAZAhV5GXQzFQAyOCnTeh0lPsVbkD57SIukQCaS7QHj7EBPIPYRYWBQO
 eaIA==
X-Gm-Message-State: AOAM5309oLtjfixhsgR3xTjerCKGYh23PbJPXyjdPwSf5Vq87m9PtV82
 EQ3eWpavMVaGPyj0ZWSAYXjTgA2juNC8DO6xYROWMJ1WUdCE1r4MvhA+pXPXpFj6oxN4is1Nygw
 xRypBlwKxdqYzIsU=
X-Received: by 2002:a7b:cc8b:: with SMTP id p11mr4283224wma.25.1628596586422; 
 Tue, 10 Aug 2021 04:56:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxfbg0eLxvdQ2AVGPY12Gl7y6VDE5UDcz1RxovMdHOCEYd9VgRyqOUvl++whJAel75rt+uU4w==
X-Received: by 2002:a7b:cc8b:: with SMTP id p11mr4283207wma.25.1628596586232; 
 Tue, 10 Aug 2021 04:56:26 -0700 (PDT)
Received: from localhost (62.83.194.64.dyn.user.ono.com. [62.83.194.64])
 by smtp.gmail.com with ESMTPSA id g5sm2445853wmh.31.2021.08.10.04.56.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Aug 2021 04:56:25 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Subject: Re: [PATCH for-6.2 02/12] qom: Use DEVICE_*CLASS instead of
 OBJECT_*CLASS
In-Reply-To: <20210806211127.646908-3-ehabkost@redhat.com> (Eduardo Habkost's
 message of "Fri, 6 Aug 2021 17:11:17 -0400")
References: <20210806211127.646908-1-ehabkost@redhat.com>
 <20210806211127.646908-3-ehabkost@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
Date: Tue, 10 Aug 2021 13:56:25 +0200
Message-ID: <87eeb11pjq.fsf@secure.mitica>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.704,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Reply-To: quintela@redhat.com
Cc: "Daniel P. Berrange" <berrange@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 qemu-devel@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Eduardo Habkost <ehabkost@redhat.com> wrote:
> There are multiple functions where OBJECT_GET_CLASS or
> OBJECT_CLASS_CHECK are being used directly for
> DeviceClass/TYPE_DEVICE, instead of the DEVICE_GET_CLASS or
> DEVICE_CLASS wrappers.  There's no reason to not use the
> wrappers, so use them.
>
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>



> -        DeviceClass *dc = OBJECT_CLASS_CHECK(DeviceClass, list->data,
> -                                             TYPE_DEVICE);
> +        DeviceClass *dc = DEVICE_CLASS(list->data);

Finding where DEVICE_CLASS is defined is .... interesting.


