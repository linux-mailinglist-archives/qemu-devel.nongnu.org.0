Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55D2B3D2363
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Jul 2021 14:36:24 +0200 (CEST)
Received: from localhost ([::1]:35434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6Xw7-0008U6-8g
	for lists+qemu-devel@lfdr.de; Thu, 22 Jul 2021 08:36:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1m6Xnp-00012b-FV
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 08:27:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41821)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1m6Xnm-00082d-MA
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 08:27:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626956865;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ACeXeSGB5g+ibTPjfW9SyOZcgRIZ8SDLtHdX9dzoIEI=;
 b=fcBobTSdWM5j5YVJi/KcITnwJ6AZHdLysMDZTZ+RcjfPxKoxPq58fVs4ehKJo2DbMpOeXJ
 M1/LV1Cqg224Xp/KiqULeiTnk45WGu+PyC9zHrV9l0TDcQfqMUX0SRXTqlVBmIUPpCBqkF
 gF1RXaX8WPYt3jJ3atLxETt/C0Yho/M=
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com
 [209.85.166.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-277-IwB1NtszNhGHKoz864XB6A-1; Thu, 22 Jul 2021 08:27:42 -0400
X-MC-Unique: IwB1NtszNhGHKoz864XB6A-1
Received: by mail-io1-f71.google.com with SMTP id
 p7-20020a6b63070000b029050017e563a6so3925917iog.4
 for <qemu-devel@nongnu.org>; Thu, 22 Jul 2021 05:27:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ACeXeSGB5g+ibTPjfW9SyOZcgRIZ8SDLtHdX9dzoIEI=;
 b=eqt59V+q1hWDbWkptvi47ZSryGqVNE9tfQwzgNJS2Jx0BrsNMcrsywfetH3q5Y71I3
 qQ2/O8AM0//Dk6hEJZg0MvIV89oiIzjsGArjhMPjDUJgaxx5heNJRO/Lxd6nAUHCP5Uf
 5+JDXU/HC9V/yLeB45aP0Z3ymaUHJIr8Wsa3xC0VB+m3XpwOewMVAqFl74RgFvNHif8E
 7Va+QDLzVxk2QVvJ9LEovlUdVOnuIazCXFORDRSNMI9FNn5p3qC320PW/vrGvLdldPKq
 PkCoSR+xGgikkV2MIsrmVtn4yK4NC8zOFIpaIAxtwB5TSKGx5O/EXdL3+SzdW301wT/E
 VzcA==
X-Gm-Message-State: AOAM533nOzNp9p8XMsbEHPNKq4u/YA5GaLYsuSotFuAbauf6Ope2fva3
 HD30Zd8THb5rIi5TaQWyTdS5HimWLUQCJyWpGCSaj8Z2A6bMLElMOgLOkrBKNDf82U2+jKtcacj
 3tn7gqYt7u13fZ+s=
X-Received: by 2002:a92:7b08:: with SMTP id w8mr7556825ilc.190.1626956862012; 
 Thu, 22 Jul 2021 05:27:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyJq+4tNjlDsAoCiASHS32GwOy2tfU1JMNaijVq8Ynwg/ECWzKydy6MCbdRHS7uAfTy3vpNyg==
X-Received: by 2002:a92:7b08:: with SMTP id w8mr7556813ilc.190.1626956861762; 
 Thu, 22 Jul 2021 05:27:41 -0700 (PDT)
Received: from gator ([140.82.166.162])
 by smtp.gmail.com with ESMTPSA id x9sm16637352iol.2.2021.07.22.05.27.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Jul 2021 05:27:41 -0700 (PDT)
Date: Thu, 22 Jul 2021 14:27:37 +0200
From: Andrew Jones <drjones@redhat.com>
To: "wangyanan (Y)" <wangyanan55@huawei.com>
Subject: Re: [PATCH for-6.2 v2 04/11] machine: Use the computed parameters to
 calculate omitted cpus
Message-ID: <20210722122737.6zncj26bgjevflyh@gator>
References: <20210719032043.25416-1-wangyanan55@huawei.com>
 <20210719032043.25416-5-wangyanan55@huawei.com>
 <20210719164203.r3f4qdbw3y3ieghb@gator>
 <ddf16035-d99f-9974-aec6-5bd0466205ed@huawei.com>
MIME-Version: 1.0
In-Reply-To: <ddf16035-d99f-9974-aec6-5bd0466205ed@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.472,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 wanghaibin.wang@huawei.com, Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel@nongnu.org, Greg Kurz <groug@kaod.org>,
 Halil Pasic <pasic@linux.ibm.com>, Igor Mammedov <imammedo@redhat.com>,
 yuzenghui@huawei.com, Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jul 22, 2021 at 12:42:55PM +0800, wangyanan (Y) wrote:
> On 2021/7/20 0:42, Andrew Jones wrote:
> > On Mon, Jul 19, 2021 at 11:20:36AM +0800, Yanan Wang wrote:
> > > Currently we directly calculate the omitted cpus based on the already
> > > provided parameters. This makes some cmdlines like:
> > >    -smp maxcpus=16
> > >    -smp sockets=2,maxcpus=16
> > >    -smp sockets=2,dies=2,maxcpus=16
> > >    -smp sockets=2,cores=4,maxcpus=16
> > > not work. We should probably use the computed paramters to calculate
> > > cpus when maxcpus is provided while cpus is omitted, which will make
> > > above configs start to work.
> > > 
> > > Note: change in this patch won't affect any existing working cmdlines
> > > but allows more incomplete configs to be valid.
> > > 
> > > Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
> > > ---
> > >   hw/core/machine.c | 17 +++++++++--------
> > >   1 file changed, 9 insertions(+), 8 deletions(-)
> > > 
> > > diff --git a/hw/core/machine.c b/hw/core/machine.c
> > > index c9f15b15a5..668f0a1553 100644
> > > --- a/hw/core/machine.c
> > > +++ b/hw/core/machine.c
> > > @@ -767,26 +767,27 @@ static void smp_parse(MachineState *ms, SMPConfiguration *config, Error **errp)
> > >           return;
> > >       }
> > > -    /* compute missing values, prefer sockets over cores over threads */
> > >       maxcpus = maxcpus > 0 ? maxcpus : cpus;
> > > -    if (cpus == 0) {
> > > -        sockets = sockets > 0 ? sockets : 1;
> > > -        cores = cores > 0 ? cores : 1;
> > > -        threads = threads > 0 ? threads : 1;
> > > -        cpus = sockets * dies * cores * threads;
> > > -        maxcpus = maxcpus > 0 ? maxcpus : cpus;
> > > -    } else if (sockets == 0) {
> > > +    /* compute missing values, prefer sockets over cores over threads */
> > > +    if (sockets == 0) {
> > >           cores = cores > 0 ? cores : 1;
> > >           threads = threads > 0 ? threads : 1;
> > >           sockets = maxcpus / (dies * cores * threads);
> > > +        sockets = sockets > 0 ? sockets : 1;
> > >       } else if (cores == 0) {
> > >           threads = threads > 0 ? threads : 1;
> > >           cores = maxcpus / (sockets * dies * threads);
> > > +        cores = cores > 0 ? cores : 1;
> > >       } else if (threads == 0) {
> > >           threads = maxcpus / (sockets * dies * cores);
> > > +        threads = threads > 0 ? threads : 1;
> > >       }
> > I didn't think we wanted this rounding which this patch adds back into
> > cores and threads and now also sockets.
> Firstly, I think we can agree that with or without the rounding, the invalid
> configs will still be reported as invalid. So the only difference is in the
> err
> message (either report 0 or 1 of a fractional parameter). :)

An error message that says the inputs produced a fractional parameter
would be even better. If the code gets too hairy because some parameters
may be zero and without additional checks we'd risk divide by zeros,
then maybe we should output ("fractional %s", param_name) and exit at the
same places we're currently rounding up.

> 
> I added back the rounding because this patch indeed need it, we start
> to use the computed parameters to calculate cpus, so we have to ensure
> that the computed parameters are at least 1. If both cpus and maxcpus
> are omitted (e.g. -smp sockets=16), without the rounding we will get
> zeroed cpus and maxcpus, and with the rounding we will get valid result
> like "cpus=16,sockets=16,cores=1,threads=1,maxcpus=16".
> 
> If a "0" or "1" in the error message doesn't make so much difference as
> assumed for the error reporting, I suggest that we probably can keep the
> rounding which makes the parser code concise.
> > > +    /* use the computed parameters to calculate the omitted cpus */
> > > +    cpus = cpus > 0 ? cpus : sockets * dies * cores * threads;
> > > +    maxcpus = maxcpus > 0 ? maxcpus : cpus;
> > It doesn't really matter, but I think I'd rather write this like
> > 
> >   maxcpus = maxcpus > 0 ? maxcpus : sockets * dies * cores * threads;
> >   cpus = cpus > 0 ? cpus : maxcpus;
> Yes, there is no functional difference. But I think maybe we'd better keep
> some consistence with the "maxcpus = maxcpus > 0 ? maxcpus : cpus"
> at top this function and also with the smp doc in qemu-option.hx i.e.
> "If omitted the maximum number of CPUs will be set to match the initial
> CPU count" ?

I won't argue it too much, but I think we should be thinking about maxcpus
more than cpus if we're thinking about cpu topologies. I'd rather have
users keep in mind that whatever their topology generates is the max and
if they don't want to expose that many cpus to the guest then they should
provide an additional, smaller number 'cpus'. To get that mindset we may
need to adjust the documentation.

Thanks,
drew


