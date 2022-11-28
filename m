Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18E1163AD27
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Nov 2022 17:00:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ozgX6-00037y-Py; Mon, 28 Nov 2022 10:59:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ozgX5-000371-5J
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 10:58:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ozgX3-00063y-PD
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 10:58:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669651136;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UN0ku+WTjV7mhjtZkap0R4CwBi6nC5merXOuLJZzUgY=;
 b=I/1uwvF0s0LjuFpe4DTl4QqKiOa5sbt6OX6lsxegYB22sFN5M+f+YGj8Vg8Du6BdHnPAeU
 h9F7k2nQPhH+NGzbmSihhHs28KTYDhmtyIK6h2NJX3CxGD0u1lrsHxhx5mm5Jhc7L/nWdk
 mUQA1qVQtOKbT2KaRB/91P3QKRAgVQw=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-350-wH19aQjqOcuSOg_YYY6kMg-1; Mon, 28 Nov 2022 10:58:54 -0500
X-MC-Unique: wH19aQjqOcuSOg_YYY6kMg-1
Received: by mail-wr1-f69.google.com with SMTP id
 h10-20020adfaa8a000000b0024208cf285eso1421852wrc.22
 for <qemu-devel@nongnu.org>; Mon, 28 Nov 2022 07:58:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:reply-to
 :user-agent:references:in-reply-to:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=UN0ku+WTjV7mhjtZkap0R4CwBi6nC5merXOuLJZzUgY=;
 b=gRzhjW06tJwqbYl1NTi7BVButx9yoCy/y5pxH7hJg5LK5rS0bhGNVfgdBwL8q85YId
 LenJ3TrKgvdYP20sU9ASNXjwGCAZto3vpcNQFcKOyPg0S17LGtwkty6Pu97ufhmyLRVx
 Rinn3hyTB3+ZYXYqVLgpjQWkulT+d4dI06y/rZA1kilJm3atcstEWYb74aue9u/ZPMzO
 JRAVDBakbXyOoU6ZKi4OdxnwU2iFA61vkIhw6p/VZba6UxKiC2Eq14EXfGkY4WpRps6f
 RAeFEdksoGMJKJBTkGlXhjx/lMiQ2+YEo7Uf29ck9gZ+DyvioDLtRQ660hzbFcAG3IX3
 ysNw==
X-Gm-Message-State: ANoB5pkezVwlhaiqcQxmaa0ij0TNQpzpvUd7K8sWqOWUfxs79Y/Enu1l
 U5axcCHjCSWU+OOSROjgJZ0vhHbsGh+vmv98JTVNszIJM8ZpZg9l/yv/vLswq/lDmNpzNNCEQbs
 natOhDrcZKaaxH9A=
X-Received: by 2002:a1c:4b12:0:b0:3cf:5237:c0be with SMTP id
 y18-20020a1c4b12000000b003cf5237c0bemr37140997wma.163.1669651133801; 
 Mon, 28 Nov 2022 07:58:53 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6sDt2/YarcW5Yi5WbLGw0L8xMd/mn3Vr3VhWcN5EaeaIIBHL6gDN9k9OjR2uPHGYGYYDZFlg==
X-Received: by 2002:a1c:4b12:0:b0:3cf:5237:c0be with SMTP id
 y18-20020a1c4b12000000b003cf5237c0bemr37140957wma.163.1669651133599; 
 Mon, 28 Nov 2022 07:58:53 -0800 (PST)
Received: from localhost ([31.4.242.188]) by smtp.gmail.com with ESMTPSA id
 u22-20020a7bc056000000b003c6c1686b10sm18924790wmc.7.2022.11.28.07.58.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Nov 2022 07:58:53 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org,  Alistair.Francis@wdc.com,
 bin.meng@windriver.com,  palmer@dabbelt.com,
 marcandre.lureau@redhat.com,  pbonzini@redhat.com,
 yuval.shaia.ml@gmail.com,  marcel.apfelbaum@gmail.com,  mst@redhat.com,
 dgilbert@redhat.com,  pavel.dovgaluk@ispras.ru,  alex.bennee@linaro.org,
 peterx@redhat.com,  david@redhat.com,  philmd@linaro.org,
 mrolnik@gmail.com,  gaosong@loongson.cn,  yangxiaojuan@loongson.cn,
 aurelien@aurel32.net,  jiaxun.yang@flygoat.com,
 aleksandar.rikalo@syrmia.com,  berrange@redhat.com,  thuth@redhat.com,
 lvivier@redhat.com,  suhang16@mails.ucas.ac.cn,  chen.zhang@intel.com,
 lizhijian@fujitsu.com,  stefanha@redhat.com,  qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org,  virtio-fs@redhat.com,  Fam Zheng <fam@euphon.net>,
 Kevin Wolf <kwolf@redhat.com>,  Hanna Reitz <hreitz@redhat.com>,
 qemu-block@nongnu.org,  Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH v3 2/3] block/vmdk: Simplify vmdk_co_create() to return
 directly
In-Reply-To: <20221128094138.2824623-3-armbru@redhat.com> (Markus Armbruster's
 message of "Mon, 28 Nov 2022 10:41:37 +0100")
References: <20221128094138.2824623-1-armbru@redhat.com>
 <20221128094138.2824623-3-armbru@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.1 (gnu/linux)
Date: Mon, 28 Nov 2022 16:58:51 +0100
Message-ID: <877czfkr44.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
> Cc: Fam Zheng <fam@euphon.net>
> Cc: Kevin Wolf <kwolf@redhat.com>
> Cc: Hanna Reitz <hreitz@redhat.com>
> Cc: qemu-block@nongnu.org
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

Reviewed-by: Juan Quintela <quintela@redhat.com>

goto, uninitialized variable at declaraton and can use return directly.
Not bad at all.


