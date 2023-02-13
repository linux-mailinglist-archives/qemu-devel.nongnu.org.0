Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 04E75694287
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 11:17:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRVt0-0003XG-9r; Mon, 13 Feb 2023 05:16:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pRVsk-0003UV-7a
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 05:16:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pRVsh-0005Sg-Fr
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 05:16:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676283378;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=l8EEcLR6l35YX3XrsKKprZHRdUYOMMwo1PXNSz2wZ9A=;
 b=PQVv04rhF50u6tBdXKZvXD9lRozByGVI1OsHfFvsYaB/7m2ParxRzLxJ6ajyt+Tcphw8dB
 WTSzlY3Odbsid+Vdx9LJx8XbVyxQXF1zKtDLY/NhP5xOHH2DH8XESxdfYzSC4dHyndJx5i
 kPSyQCg4KpPeELjZb3vz6h52oxwEjwQ=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-93-80l2MjN3N-Gh_5_fY8KX2w-1; Mon, 13 Feb 2023 05:16:16 -0500
X-MC-Unique: 80l2MjN3N-Gh_5_fY8KX2w-1
Received: by mail-wr1-f72.google.com with SMTP id
 g8-20020a5d46c8000000b002c54a27803cso1380132wrs.22
 for <qemu-devel@nongnu.org>; Mon, 13 Feb 2023 02:16:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=l8EEcLR6l35YX3XrsKKprZHRdUYOMMwo1PXNSz2wZ9A=;
 b=m62GN2rZJD6v8gZWEvpJIX1rebq4jMRfr9OEU5Ik3rCozqMoqAtiZQJ5vWSIWDKARz
 LBxvDG04BBo+3rBf/BjAEbVFsu0loHRB6sJLChAgvpF9sqsom9EbTar1f4XKhOesVBtv
 dzTMm/3a4w4SL0xEYn7gpm2FIbATUqzhCslm8ZklI7QAgOHL6BSXCzoWysZT8ck7oF9S
 LVBdeQx3/cVdyaqEfhmG8UAGWiN6FYWRdZ5jvzgxlowAlmkWpfe2W267UbbVufGEpyn0
 gU8HYf3vZYcZ5JwuZL33PYN91Sbb4ppAvGRPPK8V/vA3o5z37cn153wtLt/YG5yhbXku
 UpHA==
X-Gm-Message-State: AO0yUKUyjDnr2RqwVlmYs56hoK7qv8fdHtTwSUOKAAI1Fuz4mwtI7Vii
 BS5aX5//FvMRSNoj9/diT78u3x7ScdyavjO6gnUsmy2Ug5nGdJvXcqt6SApCSxsb+qMF1o84M6G
 iKnwISjDJIZqoR5k=
X-Received: by 2002:a5d:5088:0:b0:2c5:4c7c:6aad with SMTP id
 a8-20020a5d5088000000b002c54c7c6aadmr6958668wrt.8.1676283375767; 
 Mon, 13 Feb 2023 02:16:15 -0800 (PST)
X-Google-Smtp-Source: AK7set+TVGz3eb/alrYtYXbtanPfHTFv/zD4NpYkfln5zG7COAaoL6ofT0ANRVCYodgvxvqixhytrw==
X-Received: by 2002:a5d:5088:0:b0:2c5:4c7c:6aad with SMTP id
 a8-20020a5d5088000000b002c54c7c6aadmr6958645wrt.8.1676283375560; 
 Mon, 13 Feb 2023 02:16:15 -0800 (PST)
Received: from redhat.com (nat-252.udc.es. [193.144.61.252])
 by smtp.gmail.com with ESMTPSA id
 v15-20020adfebcf000000b002c3f81c51b6sm10156979wrn.90.2023.02.13.02.16.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Feb 2023 02:16:14 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Zhao Liu <zhao1.liu@linux.intel.com>
Cc: Eduardo Habkost <eduardo@habkost.net>,  Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>,  Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>,  "Michael S . Tsirkin"
 <mst@redhat.com>,  Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,  Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,  qemu-devel@nongnu.org,  Zhenyu
 Wang <zhenyu.z.wang@intel.com>,  Dapeng Mi <dapeng1.mi@intel.com>,
 Zhuocheng Ding <zhuocheng.ding@intel.com>,  Robert Hoo
 <robert.hu@linux.intel.com>,  Sean Christopherson <seanjc@google.com>,
 Like Xu <like.xu.linux@gmail.com>,  Zhao Liu <zhao1.liu@intel.com>,  "Dr
 . David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [RFC 15/52] migration/postcopy-ram: Use generic topology name
 and helper
In-Reply-To: <20230213095035.158240-16-zhao1.liu@linux.intel.com> (Zhao Liu's
 message of "Mon, 13 Feb 2023 17:49:58 +0800")
References: <20230213095035.158240-1-zhao1.liu@linux.intel.com>
 <20230213095035.158240-16-zhao1.liu@linux.intel.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Mon, 13 Feb 2023 11:16:13 +0100
Message-ID: <871qmtna4y.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
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
Reply-To: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Zhao Liu <zhao1.liu@linux.intel.com> wrote:
> From: Zhao Liu <zhao1.liu@intel.com>
>
> As the generic code, here we should respect the different topologies:
> smp or hybrid.
>
> So rename PostcopyBlocktimeContext.smp_cpus_down to
> PostcopyBlocktimeContext.cpus_down, and also rename other local
> variables from smp_cpus to cpus_num, to decouple with smp topology.
>
> And use generic topology helpers to get topology information.
>
> Cc: Juan Quintela <quintela@redhat.com>
> Cc: Dr. David Alan Gilbert <dgilbert@redhat.com>
> Signed-off-by: Zhao Liu <zhao1.liu@intel.com>

I expect that this will go with your other changes through another tree,
or do you want me to take it through migration thread?

Later, Juan.


