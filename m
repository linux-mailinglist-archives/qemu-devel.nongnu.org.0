Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF0F364B511
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Dec 2022 13:22:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p54II-0004Ef-T3; Tue, 13 Dec 2022 07:21:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xuchuangxclwt@bytedance.com>)
 id 1p54Hr-0004BJ-Rq
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 07:21:38 -0500
Received: from mail-qv1-xf2f.google.com ([2607:f8b0:4864:20::f2f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xuchuangxclwt@bytedance.com>)
 id 1p54Hn-0001SA-8V
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 07:21:29 -0500
Received: by mail-qv1-xf2f.google.com with SMTP id a17so10312649qvt.9
 for <qemu-devel@nongnu.org>; Tue, 13 Dec 2022 04:21:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:mime-version:from:references
 :user-agent:in-reply-to:from:to:cc:subject:date:message-id:reply-to;
 bh=Wu0p79YXvUNv4LELcT0FlPOlP4fbtXH5LQ5QxzILN0g=;
 b=G9BU34XIE9DI27Fk6x7PlbEhKd9DB+/e8CM4GWHSbIigEV4XudyQL2GyrGZ0xSjz/V
 KCerv0iXF60eYlw0up8sE0icz9ku+QnGwMONGebpv6ZERnXQyIhaG4e10F2B68nOMPtX
 avapHEd0R1TWRkXAoPhizEh0h7/txhJ10nc44burzaOyJ6tx2EWMqDJflA8Ck8X12ZWq
 Zazsy3lqt2mYpJO1zjBSQeb6wNGX/izUDk0+jwS7WDtxR/H11FfDPdviNjFUystNTUYR
 9gm4/hVUuwKt8iYt8YZE3nUL94H4lkylJ5oSL0BFZDfCfUyNtPe1wVJBgFjB2elWaj+8
 aqqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:mime-version:from:references
 :user-agent:in-reply-to:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Wu0p79YXvUNv4LELcT0FlPOlP4fbtXH5LQ5QxzILN0g=;
 b=7vYijQqkbFZIKKkY6XR/CHN6LAagwhkJhhEj9a5SBQIJCPtgOZoK8UVSi8Su8JpYzL
 tO9mk3F/+zxC/L7wwf7TJjyvBCcj5LGz0iGcobkzvW8nDo+zC8LGjg8RReKBddcbUyIh
 4910TNPQfWF4H1tJKc3tak0RqPUsUIMvOoWJxLzCKMiR4/vMYJBJ8EvgVPtVeHOW3XJ3
 iRa6RvMJbm+haamRm0Cut3y+w3ZRMzM/DtW3J8rz+e7Llze9UkWk7nFMgPbOvaoynLFw
 FTSoeXu+Ompi+Dl/b6O5//lJafwcULxFBk0Ubhz4Rk69X8Kly8wFMMPT4Ctl6u+CZotn
 u8WQ==
X-Gm-Message-State: ANoB5pn6C2U60T9rouTezMcopNcuStoe/s43RN1G++RS3bHNgCuT+YCl
 ngrIFTp7ePLSfbpTQ8lNvXaHLKTJASa0bkd07+zPJg==
X-Google-Smtp-Source: AA0mqf7ogLqBJR4KGDeOjykiq0ITJd65W1k//bkxD6O4XfCmNAfigDaYmVqZXxjOfMjSNS0tcwhiytrkPDk+0OJox50=
X-Received: by 2002:ad4:57a9:0:b0:4bb:699e:4cec with SMTP id
 g9-20020ad457a9000000b004bb699e4cecmr69944911qvx.6.1670934085429; Tue, 13 Dec
 2022 04:21:25 -0800 (PST)
Received: from 44278815321 named unknown by gmailapi.google.com with HTTPREST; 
 Tue, 13 Dec 2022 04:21:25 -0800
In-Reply-To: <Y5eMfZci3AazVOFl@x1n>
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.2
References: <20221212164942.3614611-1-xuchuangxclwt@bytedance.com>
 <20221212164942.3614611-3-xuchuangxclwt@bytedance.com> <Y5eMfZci3AazVOFl@x1n>
From: Chuang Xu <xuchuangxclwt@bytedance.com>
Mime-Version: 1.0
Date: Tue, 13 Dec 2022 04:21:25 -0800
Message-ID: <CALophutKKqk5nDK99to-eQDK9UDxpYcwWsFeXWRGDZiZSfGSEw@mail.gmail.com>
Subject: Re: [RFC v2 2/3] virtio: support delay of checks in virtio_load()
To: Peter Xu <peterx@redhat.com>
Cc: qemu-devel@nongnu.org, dgilbert@redhat.com, quintela@redhat.com, 
 zhouyibo@bytedance.com, Paolo Bonzini <pbonzini@redhat.com>, david@redhat.com, 
 philmd@linaro.org, mst@redhat.com
Content-Type: multipart/alternative; boundary="0000000000009b0adb05efb4a8db"
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2f;
 envelope-from=xuchuangxclwt@bytedance.com; helo=mail-qv1-xf2f.google.com
X-Spam_score_int: 29
X-Spam_score: 2.9
X-Spam_bar: ++
X-Spam_report: (2.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 FORGED_MUA_MOZILLA=2.309, FROM_LOCAL_NOVOWEL=0.5, HK_RANDOM_ENVFROM=0.999,
 HK_RANDOM_FROM=0.999, HTML_MESSAGE=0.001, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

--0000000000009b0adb05efb4a8db
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On 2022/12/13 =E4=B8=8A=E5=8D=884:18, Peter Xu wrote:

On Tue, Dec 13, 2022 at 12:49:41AM +0800, Chuang Xu wrote:

+bool migration_enable_load_check_delay;

I'm just afraid this is still too hacky.

One thing is because this variable itself to be only set at specific phase
during migration to cover that commit().  The other thing is I'm not sure
we can always rely on the commit() being happen 100% - what if there's no
memory layout changes throughout the whole process of vm load?  That'll be
skipped if memory_region_update_pending=3D=3Dfalse as I said.

Yes, you're right. I wanted to set memory_region_update_pending to true at
the beginning of qemu_loadvm_state_main(), but somehow I forgot this detail=
..=F0=9F=98=AD

So far the best I can come up with is we allow each virtio device to
register a vm state change handler (during virtio_load) to do the rest,
then in the handler it unregisters itself so it only runs once right before
the VM starts.  But I'm not sure whether the virtio developers will be
happy with it.  Maybe worth a try.

Feel free to have a look at like kvmvapic_vm_state_change() if you think
that idea worth exploring.

That's a good idea!

But I don't think it's necessary to register a new vm state change handler.
Maybe we just need to add a delay_check flag to VirtIODevice and do those
delayed checks in virtio_vmstate_change() when delay_check is true.

Later I'll upload the v3 patches.

Thanks!

--0000000000009b0adb05efb4a8db
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<html><head>
    <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF-8=
">
  </head>
  <body>
    <p><br>
    </p>
    <div class=3D"moz-cite-prefix"><div id=3D"lark-mail-quote-804744c4b3741=
b79a4a539300be2c4b2">On 2022/12/13 =E4=B8=8A=E5=8D=884:18, Peter Xu wrote:<=
br>
    </div></div>
    <blockquote type=3D"cite" cite=3D"mid:Y5eMfZci3AazVOFl@x1n">
      <pre class=3D"moz-quote-pre">On Tue, Dec 13, 2022 at 12:49:41AM +0800=
, Chuang Xu wrote:
</pre>
      <blockquote type=3D"cite">
        <pre class=3D"moz-quote-pre">+bool migration_enable_load_check_dela=
y;
</pre>
      </blockquote>
      <pre class=3D"moz-quote-pre">I&#39;m just afraid this is still too ha=
cky.

One thing is because this variable itself to be only set at specific phase
during migration to cover that commit().  The other thing is I&#39;m not su=
re
we can always rely on the commit() being happen 100% - what if there&#39;s =
no
memory layout changes throughout the whole process of vm load?  That&#39;ll=
 be
skipped if memory_region_update_pending=3D=3Dfalse as I said.</pre>
    </blockquote>
    <pre>Yes, you&#39;re right. I wanted to set memory_region_update_pendin=
g to true at=20
the beginning of qemu_loadvm_state_main(), but somehow I forgot this detail=
..=F0=9F=98=AD</pre>
    <blockquote type=3D"cite" cite=3D"mid:Y5eMfZci3AazVOFl@x1n">
      <pre class=3D"moz-quote-pre">So far the best I can come up with is we=
 allow each virtio device to
register a vm state change handler (during virtio_load) to do the rest,
then in the handler it unregisters itself so it only runs once right before
the VM starts.  But I&#39;m not sure whether the virtio developers will be
happy with it.  Maybe worth a try.

Feel free to have a look at like kvmvapic_vm_state_change() if you think
that idea worth exploring.
</pre>
    </blockquote>
    <pre class=3D"moz-quote-pre">That&#39;s a good idea!=20

But I don&#39;t think it&#39;s necessary to register a new vm state change =
handler.=20
Maybe we just need to add a delay_check flag to VirtIODevice and do those=
=20
delayed checks in virtio_vmstate_change() when delay_check is true.

Later I&#39;ll upload the v3 patches.

Thanks!
</pre>
 =20
</body></html>

--0000000000009b0adb05efb4a8db--

