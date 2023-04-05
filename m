Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21E386D7A29
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Apr 2023 12:46:11 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pk0dM-000812-Oq; Wed, 05 Apr 2023 06:44:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pk0dK-00080a-He
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 06:44:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pk0dH-0001mq-NH
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 06:44:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680691490;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kq6oZ7N2bYTf0eEXEKbV1aFmSrlbXHt85D5v+zP8YuE=;
 b=P5h8Z4HanZmxIKjr+3U3TADXTbFoS61M9v/o8WYWLp6aDcjWEVGMQh9jvqvYkyXhB7nXv/
 aXE7Vh6ZcS2BNqt+uBWLHY1+6Yng+ZUXJQO93+lKhQ7sDeQ09IoKa0pkXlVM8fUP1j0aN5
 GtLXscteQOusM/5wIEz7dexXxOGQ0bs=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-601-NyH2sXngPQitOtm6xeRUOg-1; Wed, 05 Apr 2023 06:44:48 -0400
X-MC-Unique: NyH2sXngPQitOtm6xeRUOg-1
Received: by mail-ed1-f71.google.com with SMTP id
 b6-20020a509f06000000b005029d95390aso12975547edf.2
 for <qemu-devel@nongnu.org>; Wed, 05 Apr 2023 03:44:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680691488;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kq6oZ7N2bYTf0eEXEKbV1aFmSrlbXHt85D5v+zP8YuE=;
 b=4y7wotcTWX9Z9QBWmMRFvEP1IOAOtD2QQn+kE77swmcr20iUhAfuE0HjWNEFCFJqBT
 1Vx+jUNZHYJXt3u23nR4TZ3Cp+VfKpYRlIaJndOSdtjYxaDL301iD1lin9CmDLeQVokO
 BKV+wD/mUH2f8yduzD5MkQ/OGSP1/waHifbtiI44eB6zIL0GB+lEs60C8k1rfvQg+vP+
 5hH9dfhB5ve+m6jXOpL3EebFM+u8aPKG8gbAbsGoyHXYC9Ba0lYUhHguciF64kNwdcwm
 UYbFJUaQ3hV5kdj11N0qB0jM3hHoDOsoyQZP+UeUx8QZiuCjKB2ay5TbPhT7Oe35WcUi
 fQxQ==
X-Gm-Message-State: AAQBX9cdjczN1ruOelQY/5taZZxTSPv1hSIV23PpNsRWgBnXWqn6Hguj
 N1BfW7FZmnFJvZ19J+5FfbWCQ4B+E9eDOYhVkFru+1t/k80ml1ypdfrnd6kctyt4QKx64SlzW9Y
 Sx9sVEiASIMekcyY=
X-Received: by 2002:a17:906:d045:b0:931:624b:6804 with SMTP id
 bo5-20020a170906d04500b00931624b6804mr2345360ejb.33.1680691487916; 
 Wed, 05 Apr 2023 03:44:47 -0700 (PDT)
X-Google-Smtp-Source: AKy350b5k+F7FQS0kEh/ahvkTDuRpd40DUgmdol+8mUYtq06ub6whVh6ZTdy0b/m/9U1TYG1Nw5Bew==
X-Received: by 2002:a17:906:d045:b0:931:624b:6804 with SMTP id
 bo5-20020a170906d04500b00931624b6804mr2345345ejb.33.1680691487657; 
 Wed, 05 Apr 2023 03:44:47 -0700 (PDT)
Received: from redhat.com ([2.52.139.22]) by smtp.gmail.com with ESMTPSA id
 p25-20020a170906a01900b0093a7952411asm7207199ejy.48.2023.04.05.03.44.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Apr 2023 03:44:47 -0700 (PDT)
Date: Wed, 5 Apr 2023 06:44:42 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Cc: Viresh Kumar <viresh.kumar@linaro.org>, qemu-devel@nongnu.org,
 virtio-dev@lists.oasis-open.org, Stefan Hajnoczi <stefanha@redhat.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 stratos-dev@op-lists.linaro.org,
 Oleksandr Tyshchenko <olekstysh@gmail.com>, xen-devel@lists.xen.org,
 Andrew Cooper <andrew.cooper3@citrix.com>, Juergen Gross <jgross@suse.com>,
 Sebastien Boeuf <sebastien.boeuf@intel.com>,
 Liu Jiang <gerry@linux.alibaba.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>
Subject: Re: [PATCH V3 0/2] qemu: vhost-user: Support Xen memory mapping quirks
Message-ID: <20230405064417-mutt-send-email-mst@kernel.org>
References: <cover.1678351495.git.viresh.kumar@linaro.org>
 <20230405080512.nvxiw4lv7hyuzqej@vireshk-i7>
 <87h6tulkae.fsf@linaro.org>
 <20230405060340-mutt-send-email-mst@kernel.org>
 <87cz4ilj4j.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87cz4ilj4j.fsf@linaro.org>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Wed, Apr 05, 2023 at 11:24:43AM +0100, Alex Bennée wrote:
> 
> "Michael S. Tsirkin" <mst@redhat.com> writes:
> 
> > On Wed, Apr 05, 2023 at 11:00:34AM +0100, Alex Bennée wrote:
> >> 
> >> Viresh Kumar <viresh.kumar@linaro.org> writes:
> >> 
> >> > On 09-03-23, 14:20, Viresh Kumar wrote:
> >> >> Hello,
> >> >> 
> >> >> This patchset tries to update the vhost-user protocol to make it support special
> >> >> memory mapping required in case of Xen hypervisor.
> >> >> 
> >> >> The first patch is mostly cleanup and second one introduces a new xen specific
> >> >> feature.
> >> >
> >> > Can we apply this now ? I have developed code for rust-vmm crates
> >> > based on this and we need to get this merged/finalized first before
> >> > merging those changes.
> >> 
> >> 
> >> I've queued into my virtio/vhost-user-device series so I'll get merged
> >> with that series unless mst wants to take it now.
> >
> > Well the patches are tagged and I was going to take these after the release.
> > Probably easier not to work on this in two trees.
> > Still if there's something in your tree being blocked
> > by these patches then
> > Acked-by: Michael S. Tsirkin <mst@redhat.com>
> > Let me know.
> 
> The virtio/vhost-user-device tree work is orthogonal to this vhost-user
> enhancement although all the work is related to our latest VirtIO
> project inside Linaro, Orko:
> https://linaro.atlassian.net/wiki/spaces/ORKO/overview
> 
> So if you are happy please take these patches now for when the tree
> re-opens.

Yes, I tagged them for when the tree reopens.

> >
> >
> >> >
> >> > Thanks.
> >> 
> >> 
> >> -- 
> >> Alex Bennée
> >> Virtualisation Tech Lead @ Linaro
> 
> 
> -- 
> Alex Bennée
> Virtualisation Tech Lead @ Linaro


