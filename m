Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BF7E5913D6
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Aug 2022 18:24:33 +0200 (CEST)
Received: from localhost ([::1]:42442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oMXSZ-0004Js-E8
	for lists+qemu-devel@lfdr.de; Fri, 12 Aug 2022 12:24:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60298)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1oMX7P-00005o-O5
 for qemu-devel@nongnu.org; Fri, 12 Aug 2022 12:02:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:50655)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1oMX7L-0004Lz-6T
 for qemu-devel@nongnu.org; Fri, 12 Aug 2022 12:02:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660320154;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tWCROq06/HbysbDX3N02GUQEfkGQcYaVh4ssHk7eqwc=;
 b=NOjPlr03Ugf7H9KFjmXbBhz6icwZJvLGbOMhKo21s0g72LbuVI8LL4PuVUczFGv6rhhl23
 TV/97fDBy1Os6E0S/4kGcCgiMX9ab/AHEBkVUGTJdaAUVEpETCAUp5DQeBNTlHIYDblPH3
 i/1oANbYQtgcv+e7I24ZuE9bkVY+9fc=
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com
 [209.85.166.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-637-Q_rTtOhbMd2fNYd0XtIcHg-1; Fri, 12 Aug 2022 12:02:32 -0400
X-MC-Unique: Q_rTtOhbMd2fNYd0XtIcHg-1
Received: by mail-il1-f198.google.com with SMTP id
 z9-20020a056e02088900b002e35dba878cso843320ils.10
 for <qemu-devel@nongnu.org>; Fri, 12 Aug 2022 09:02:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=tWCROq06/HbysbDX3N02GUQEfkGQcYaVh4ssHk7eqwc=;
 b=vGQHCiMp8nTSVMMk/QTKXe18lekryeusNenQC2HWhKt7pywlyaMOOBQnNBuppETI7U
 oFleBgucoyqMulEW5TIcGRje2d4xb8Ko9a2IixzcDXjC4nM/rRq4PeANJLQxYPrU2vA5
 t9KWZfRP6UhgUcM94WjilMXdZpeST1YG+KK+KPrBj0vWhphgP8NP5JzvwUF5gn/p3Qh2
 G/KbZXWo6U1GqHZuH1Ca1roQLGG2n37CIhP0gN7rDZYZ+ISsKyFTEyDM5JQqrqYiVMaT
 dgfVqUE4fwOsnvzSQwfIDsDU0HYod44M51LG/qiYpgEjEAZa4qG1Aw1wR7k8cd9uXFvb
 VFfA==
X-Gm-Message-State: ACgBeo2/yQVA4DJ9AuM028+CMQYtfpo+aO6y4+lBM2V7bfq0iUH0ZrsG
 3t8bFPe3OjjZ3tOsZTiFAUlHnArugatcaqly3Gw+CGdtT0QDneDEVlQ8NYGCj8mKu6QkR0KLCUU
 Virg0QDAoj4i7n/Lhi8m9B5t2YqoqM+4=
X-Received: by 2002:a5d:8ac9:0:b0:684:b389:b38b with SMTP id
 e9-20020a5d8ac9000000b00684b389b38bmr1903853iot.138.1660320151848; 
 Fri, 12 Aug 2022 09:02:31 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5ORavVDasHXUlmXGF33Nqlj8ou/AQhGkBgDe0Q7YskxE6HVFcfqmm3ez7gEp7HfYTpkab+qAlTTFngcZdFmxc=
X-Received: by 2002:a5d:8ac9:0:b0:684:b389:b38b with SMTP id
 e9-20020a5d8ac9000000b00684b389b38bmr1903793iot.138.1660320151551; Fri, 12
 Aug 2022 09:02:31 -0700 (PDT)
MIME-Version: 1.0
References: <20220729130040.1428779-1-afaria@redhat.com>
 <20220729130040.1428779-3-afaria@redhat.com>
 <CAFEAcA83Eaw59H7ha0hScvX1yF8LrJatWqD-hnX0eVy+Ne4EUQ@mail.gmail.com>
In-Reply-To: <CAFEAcA83Eaw59H7ha0hScvX1yF8LrJatWqD-hnX0eVy+Ne4EUQ@mail.gmail.com>
From: Alberto Faria <afaria@redhat.com>
Date: Fri, 12 Aug 2022 17:01:55 +0100
Message-ID: <CAELaAXxWE60rvj3TH8cR8g46JO+n+s8AOEqMpErcSjXS+GN=XA@mail.gmail.com>
Subject: Re: [RFC v2 02/10] Drop unused static function return values
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Stefano Garzarella <sgarzare@redhat.com>, Hannes Reinecke <hare@suse.com>, 
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, 
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>, 
 "Maciej S. Szmigiero" <maciej.szmigiero@oracle.com>, Peter Lieven <pl@kamp.de>,
 kvm@vger.kernel.org, 
 Xie Yongji <xieyongji@bytedance.com>, Eric Auger <eric.auger@redhat.com>, 
 Hanna Reitz <hreitz@redhat.com>, Jeff Cody <codyprime@gmail.com>,
 Eric Blake <eblake@redhat.com>, "Denis V. Lunev" <den@openvz.org>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Christian Schoenebeck <qemu_oss@crudebyte.com>, Stefan Weil <sw@weilnetz.de>, 
 Klaus Jensen <its@irrelevant.dk>, Laurent Vivier <lvivier@redhat.com>, 
 Alberto Garcia <berto@igalia.com>, Michael Roth <michael.roth@amd.com>, 
 Juan Quintela <quintela@redhat.com>, David Hildenbrand <david@redhat.com>,
 qemu-block@nongnu.org, 
 Konstantin Kostiuk <kkostiuk@redhat.com>, Kevin Wolf <kwolf@redhat.com>, 
 Gerd Hoffmann <kraxel@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>, 
 Marcelo Tosatti <mtosatti@redhat.com>, Greg Kurz <groug@kaod.org>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Amit Shah <amit@kernel.org>,
 Paolo Bonzini <pbonzini@redhat.com>, 
 Alex Williamson <alex.williamson@redhat.com>, Peter Xu <peterx@redhat.com>, 
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 Ronnie Sahlberg <ronniesahlberg@gmail.com>, 
 Jason Wang <jasowang@redhat.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>, 
 Richard Henderson <richard.henderson@linaro.org>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>, 
 Eduardo Habkost <eduardo@habkost.net>, Fam Zheng <fam@euphon.net>,
 Thomas Huth <thuth@redhat.com>, Keith Busch <kbusch@kernel.org>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 "Richard W.M. Jones" <rjones@redhat.com>, John Snow <jsnow@redhat.com>, 
 Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=afaria@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On Wed, Aug 3, 2022 at 1:30 PM Peter Maydell <peter.maydell@linaro.org> wrote:
> The problem with a patch like this is that it rolls up into a
> single patch changes to the API of many functions in multiple
> subsystems across the whole codebase. Some of those changes
> might be right; some might be wrong. No single person is going
> to be in a position to review the whole lot, and a +248-403
> patch email makes it very unwieldy to try to discuss.
>
> If you want to propose some of these I think you need to:
>  * split it out so that you're only suggesting changes in
>    one subsystem at a time
>  * look at the places you are suggesting changes, to see if
>    the correct answer is actually "add the missing error
>    check in the caller(s)"
>  * not change places that are following standard API patterns
>    like "return bool and have an Error** argument"

Sounds good. For now, I'll limit the changes to a few representative
cases e.g. in the block layer, since this patch is mostly intended as
a demonstration of the type of issue that the check catches. Once
there is agreement on the semantics for the check, I'll probably send
a separate tree-wide series with per-subsystem patches.

Thanks,
Alberto


