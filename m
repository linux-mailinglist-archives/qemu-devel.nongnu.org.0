Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0BAF63AD28
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Nov 2022 17:00:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ozgXh-0003E8-Ca; Mon, 28 Nov 2022 10:59:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ozgXe-0003DD-UP
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 10:59:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ozgXc-00066Q-FU
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 10:59:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669651171;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/1IzXla6DDb3kJifsStnlw4Qa7gNI9PODBtyiQ/YSzk=;
 b=HR7l3/umoDeQwXxJCL7XAvPvNNiMJQE7IvAQkkEHpNXGUPAxJxkXC7xhkDUTKxkygTWrBi
 U+0rcDFBmzdxR12G98docimzQaXXIm6OCrv1wx/cJv9ZB8sL9tCdMmw2N/E8+4qj8e7qw9
 zraPjrro6ngXrvlA1MDR9Jv0bdZHbdw=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-654--BJGB4nWNKezwul_fkOCXw-1; Mon, 28 Nov 2022 10:59:30 -0500
X-MC-Unique: -BJGB4nWNKezwul_fkOCXw-1
Received: by mail-wr1-f72.google.com with SMTP id
 p2-20020adfaa02000000b00241d7fb17d7so2095215wrd.5
 for <qemu-devel@nongnu.org>; Mon, 28 Nov 2022 07:59:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:reply-to
 :user-agent:references:in-reply-to:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/1IzXla6DDb3kJifsStnlw4Qa7gNI9PODBtyiQ/YSzk=;
 b=yCGW2J35dT7Z+hjMHH98ZLTHaUntVa/gvLfwGuVxo+kD7TrErN1J2nbXlsS0kYr9lE
 CH80vKvW5KyKgs3uqbwrCM3xf0LgVHbz5Q6H+qdAZiWMgcRPCSH+Hs5RzcdeGntK/r8M
 Z6GG4NRRdFGvoM9gCxzSZC5TWIKkblJa+BPzZT2lGz7J+Rsggwu6Fufs2UBQa1ZlEaah
 Ej1Cm/BLcxyX0uALykAq2J4Oeui6mTE3on28xWh9OrqR0tkGCb6cWFiVIGoZyqsx58+H
 Ry2bGewiLKyFe2wM3En3nwsnUJTvTIGaB6N/3eoLTL6AVkJryu/4ckXHS0fJpWNyeQYA
 RAng==
X-Gm-Message-State: ANoB5pkfhhk0d8dxjTuxGgJkHuWF3YbCEHU/rvzDAgFOPn8vMBEcufa5
 sR5ae1oqL94H8hEz3WKyOYmr0+JtsZyYkz0mPBhxb2Z+htLx4qgPUR6RK/TCxa85qaViEqmKnXZ
 5PD+TaOEYF1i9yG0=
X-Received: by 2002:adf:ed01:0:b0:241:b4cc:4e9e with SMTP id
 a1-20020adfed01000000b00241b4cc4e9emr20798420wro.287.1669651169004; 
 Mon, 28 Nov 2022 07:59:29 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4OYViHyloJT8wO2lk37YjauITxsemI5W1bX5ZkalWXYJlfkWYuNcq4Xj9CUpcvq3NkKcVeGA==
X-Received: by 2002:adf:ed01:0:b0:241:b4cc:4e9e with SMTP id
 a1-20020adfed01000000b00241b4cc4e9emr20798373wro.287.1669651168767; 
 Mon, 28 Nov 2022 07:59:28 -0800 (PST)
Received: from localhost ([31.4.242.188]) by smtp.gmail.com with ESMTPSA id
 k17-20020a05600c1c9100b003c6b874a0dfsm20387267wms.14.2022.11.28.07.59.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Nov 2022 07:59:28 -0800 (PST)
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
 qemu-ppc@nongnu.org,  virtio-fs@redhat.com,  BALATON Zoltan
 <balaton@eik.bme.hu>
Subject: Re: [PATCH v3 3/3] ppc4xx_sdram: Simplify sdram_ddr_size() to
 return directly
In-Reply-To: <20221128094138.2824623-4-armbru@redhat.com> (Markus Armbruster's
 message of "Mon, 28 Nov 2022 10:41:38 +0100")
References: <20221128094138.2824623-1-armbru@redhat.com>
 <20221128094138.2824623-4-armbru@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.1 (gnu/linux)
Date: Mon, 28 Nov 2022 16:59:25 +0100
Message-ID: <8735a3kr36.fsf@secure.mitica>
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
> Suggested-by: BALATON Zoltan <balaton@eik.bme.hu>
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> Reviewed-by: BALATON Zoltan <balaton@eik.bme.hu>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

Reviewed-by: Juan Quintela <quintela@redhat.com>


