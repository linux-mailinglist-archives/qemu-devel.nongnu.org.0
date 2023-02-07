Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D7C468D1AD
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 09:46:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPJc3-0001lL-Eb; Tue, 07 Feb 2023 03:46:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pPJc1-0001eP-4e
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 03:46:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pPJbz-0003sW-L0
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 03:46:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675759558;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=wnXmxEy18VRNv/JTwOIjp3Ckm5/xzcumwoozZrl4Flo=;
 b=MYKARbvh+JcmV6aTg9GkAld+7nXhWXwksWYeC0TkdakVp1WfMUGDEd0eziDArlhqq7kqsX
 TswlBUTHCUDRLe+tIsHZZKZ5M1y6TRfrSNKP2LNFnE8tEDP0Nu81pdHWOI23vVo451WmYm
 VVRw+Jx2JQS1IDAsiYp7Kq4SnvH5nLc=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-582-y9d3rKV3PLyyjlFNPdOoQw-1; Tue, 07 Feb 2023 03:45:57 -0500
X-MC-Unique: y9d3rKV3PLyyjlFNPdOoQw-1
Received: by mail-wr1-f71.google.com with SMTP id
 f17-20020adff991000000b002c3db4cbceaso1195196wrr.14
 for <qemu-devel@nongnu.org>; Tue, 07 Feb 2023 00:45:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wnXmxEy18VRNv/JTwOIjp3Ckm5/xzcumwoozZrl4Flo=;
 b=OmA19xhyaETIGxInCjdjhkW+GrUV30uL9Tzum3vqMC55JTe5PtZzsTOAOR2GV9lDkJ
 nAF2U6LMX53T5KeqJNn42SqzYVy9Fib2FAipdOnrFSWU+YL97Iy+a4IKjj4n264mPaPo
 dgndY6I1Jq2+ayYf6qErBKip42bCOexM74l3KiX2uiskOY+ZDluvguubu1qZqg6KqLnu
 cXMawaJfnpx9EmxwVre2tcp4wcK/a7MG6rPvmw2jOeKco7xLXsuRBAH0XDfzLraY5b+a
 ccJVtyVZEDZufilumJY2ZmxH19xqhORCyNSSv0Fm8ApgR+FjKSOMce9Q1ndcT/oryF9R
 1LJA==
X-Gm-Message-State: AO0yUKX1oV1qbbaFbGz3fF+UXVykuD3B39LPq3nzeuyS7/cn+ys7GKvG
 CAwTUQ/HLtAa7WHGaWaq78yDg6GIbdjW+/T0GvKWvBhSKVZgk9q0KqcnHCDmL5gY9c0IgX/zXFs
 2Jff4rafGnZUvySw=
X-Received: by 2002:a05:600c:16d4:b0:3e0:fad:675a with SMTP id
 l20-20020a05600c16d400b003e00fad675amr2166228wmn.38.1675759556504; 
 Tue, 07 Feb 2023 00:45:56 -0800 (PST)
X-Google-Smtp-Source: AK7set/cvaHpzua+MFzrbL3tUe3NT0RfivCitPE2jvDRnSgEnbzL3BKWX7zPUgsCjQ3Hzqu1/aG9XQ==
X-Received: by 2002:a05:600c:16d4:b0:3e0:fad:675a with SMTP id
 l20-20020a05600c16d400b003e00fad675amr2166210wmn.38.1675759556356; 
 Tue, 07 Feb 2023 00:45:56 -0800 (PST)
Received: from redhat.com (nat-252.udc.es. [193.144.61.252])
 by smtp.gmail.com with ESMTPSA id
 p17-20020a05600c205100b003dd1bd0b915sm15147129wmg.22.2023.02.07.00.45.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Feb 2023 00:45:55 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org,  marcandre.lureau@redhat.com,  mst@redhat.com,
 imammedo@redhat.com,  ani@anisinha.ca,  eduardo@habkost.net,
 marcel.apfelbaum@gmail.com,  philmd@linaro.org,  wangyanan55@huawei.com,
 jiri@resnulli.us,  jasowang@redhat.com,  pavel.dovgaluk@ispras.ru,
 pbonzini@redhat.com,  zhanghailiang@xfusion.com,  dgilbert@redhat.com,
 michael.roth@amd.com,  kkostiuk@redhat.com
Subject: Re: [PATCH 02/12] dump: Improve error message when target doesn't
 support memory dump
In-Reply-To: <20230207075115.1525-3-armbru@redhat.com> (Markus Armbruster's
 message of "Tue, 7 Feb 2023 08:51:05 +0100")
References: <20230207075115.1525-1-armbru@redhat.com>
 <20230207075115.1525-3-armbru@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Tue, 07 Feb 2023 09:45:54 +0100
Message-ID: <87v8kdc18d.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
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

Markus Armbruster <armbru@redhat.com> wrote:
> The QERR_ macros are leftovers from the days of "rich" error objects.
> We've been trying to reduce their remaining use.
>
> Get rid of a use of QERR_UNSUPPORTED, and improve the rather vague
> error message
>
>     (qemu) dump-guest-memory mumble
>     Error: this feature or command is not currently supported
>
> to
>
>     Error: guest memory dumping is not supported on this target
>
> Signed-off-by: Markus Armbruster <armbru@redhat.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>

Both your and philippe message are ok with me.


