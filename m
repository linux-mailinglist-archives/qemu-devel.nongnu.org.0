Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB7C24D99F3
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Mar 2022 12:07:07 +0100 (CET)
Received: from localhost ([::1]:49574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nU518-0000tk-Oi
	for lists+qemu-devel@lfdr.de; Tue, 15 Mar 2022 07:07:06 -0400
Received: from eggs.gnu.org ([209.51.188.92]:60672)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nU4sz-0003d3-Lt
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 06:58:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59205)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nU4su-00035j-EK
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 06:58:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647341915;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=j4q1mDkTkfU3rhMwSrf7xL1WLfewGHyjSGlrtIXdyt8=;
 b=T7EDu2xV275NETyx7EG9BEbB+wO4fU9kQnmfUAsW5KXsY2bPrdqAMjN80fndtWGiVyVxSp
 Dfi1veKNTP0twdnT3vIPv8kr//a24jtyl8WbM3yDUG4c05PB7asyNU1Kb3GvLM4NYIT7KW
 wsMeecsMTnMUmjaLcPitSUqa8nRoweQ=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-306-M7nMWUoJN-OJvKsvgwFp0g-1; Tue, 15 Mar 2022 06:58:34 -0400
X-MC-Unique: M7nMWUoJN-OJvKsvgwFp0g-1
Received: by mail-wr1-f69.google.com with SMTP id
 o9-20020adfca09000000b001ea79f7edf8so5169273wrh.16
 for <qemu-devel@nongnu.org>; Tue, 15 Mar 2022 03:58:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=j4q1mDkTkfU3rhMwSrf7xL1WLfewGHyjSGlrtIXdyt8=;
 b=taXgiUhC1kjpgGGbvTqMrdF3sQ62amepGBI1XhRkV/Shw0GOrtydniMhgyebFNJKw0
 PGHIvwKq09Co6lMZKSss8jVMKKMKf9nS3x72xPzsDhz5NqmDhzpR5bUCwXpxCcrwdWFe
 E7j+SZfKRV3GYUY9lneOA3SUN8TwB0TWVovCai79sUmkiTW1HoSD4wRmcTM97szawF0c
 5ykD6CnEBE7h0GrrH4L9U4ubwm0g+4+q329SBJ8xtJSHLIbLpQgA6DMfHMAdy5D4gP9e
 rJcRStp2SyH2CMdhgGo5w4sz6jiviFh6xnaiJ0OongAbo6ZWLFgkYLoZRBjdrO8rASIR
 h25Q==
X-Gm-Message-State: AOAM532HggnP8yWU0qsoPVe0O/0LOHl5j20ef+g+0h1cD/JUee0fChN8
 btGBnNmeJcN+hjtQwfRePFmwQFKf6tbvGorlSoeoLp2pBDRLtYkvZBf/WYwHrWuyT5eXtywjuO3
 BuFmY2dFNu4NWgyA=
X-Received: by 2002:adf:e704:0:b0:203:750b:3d8 with SMTP id
 c4-20020adfe704000000b00203750b03d8mr19437740wrm.623.1647341912944; 
 Tue, 15 Mar 2022 03:58:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy8F5reu0obf+EcRrMdtMT6tiW8zTCLp5lDbrl9sclZsfIDBUU+L8B96ElFqtFOlRiqihEQ9A==
X-Received: by 2002:adf:e704:0:b0:203:750b:3d8 with SMTP id
 c4-20020adfe704000000b00203750b03d8mr19437702wrm.623.1647341912687; 
 Tue, 15 Mar 2022 03:58:32 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 l41-20020a05600c1d2900b00389d3e18f8esm2188196wms.26.2022.03.15.03.58.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Mar 2022 03:58:31 -0700 (PDT)
Date: Tue, 15 Mar 2022 10:58:28 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH 3/3] Use g_new() & friends where that makes obvious sense
Message-ID: <YjBxVFUw2DtBniYS@work-vm>
References: <20220314160108.1440470-1-armbru@redhat.com>
 <20220314160108.1440470-4-armbru@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220314160108.1440470-4-armbru@redhat.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, kvm@vger.kernel.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>, Klaus Jensen <its@irrelevant.dk>,
 KONRAD Frederic <frederic.konrad@adacore.com>,
 Konstantin Kostiuk <kkostiuk@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Ani Sinha <ani@anisinha.ca>, Reinoud Zandijk <reinoud@netbsd.org>,
 Eric Blake <eblake@redhat.com>, Sunil Muthuswamy <sunilmut@microsoft.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Juan Quintela <quintela@redhat.com>, John Snow <jsnow@redhat.com>,
 Paul Durrant <paul@xen.org>, Magnus Damm <magnus.damm@gmail.com>,
 Kamil Rytarowski <kamil@netbsd.org>,
 "Gonglei \(Arei\)" <arei.gonglei@huawei.com>,
 =?iso-8859-1?Q?Herv=E9?= Poussineau <hpoussin@reactos.org>,
 Michael Roth <michael.roth@amd.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Laurent Vivier <lvivier@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, Amit Shah <amit@kernel.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, haxm-team@intel.com,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 Fabien Chouteau <chouteau@adacore.com>, Yuval Shaia <yuval.shaia.ml@gmail.com>,
 Thomas Huth <thuth@redhat.com>, Eric Auger <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>, qemu-arm@nongnu.org,
 =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Paolo Bonzini <pbonzini@redhat.com>, Keith Busch <kbusch@kernel.org>,
 qemu-ppc@nongnu.org, David Hildenbrand <david@redhat.com>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 David Gibson <david@gibson.dropbear.id.au>,
 Eduardo Habkost <eduardo@habkost.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, Max Filippov <jcmvbkbc@gmail.com>,
 qemu-s390x@nongnu.org, Patrick Venture <venture@google.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Corey Minyard <cminyard@mvista.com>, Wenchao Wang <wenchao.wang@intel.com>,
 Igor Mammedov <imammedo@redhat.com>, Colin Xu <colin.xu@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Markus Armbruster (armbru@redhat.com) wrote:
> g_new(T, n) is neater than g_malloc(sizeof(T) * n).  It's also safer,
> for two reasons.  One, it catches multiplication overflowing size_t.
> Two, it returns T * rather than void *, which lets the compiler catch
> more type errors.
> 
> This commit only touches allocations with size arguments of the form
> sizeof(T).
> 
> Patch created mechanically with:
> 
>     $ spatch --in-place --sp-file scripts/coccinelle/use-g_new-etc.cocci \
> 	     --macro-file scripts/cocci-macro-file.h FILES...
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>

Just a small patch then...

> diff --git a/migration/dirtyrate.c b/migration/dirtyrate.c
> index d65e744af9..aace12a787 100644
> --- a/migration/dirtyrate.c
> +++ b/migration/dirtyrate.c
> @@ -91,7 +91,7 @@ static struct DirtyRateInfo *query_dirty_rate_info(void)
>  {
>      int i;
>      int64_t dirty_rate = DirtyStat.dirty_rate;
> -    struct DirtyRateInfo *info = g_malloc0(sizeof(DirtyRateInfo));
> +    struct DirtyRateInfo *info = g_new0(DirtyRateInfo, 1);
>      DirtyRateVcpuList *head = NULL, **tail = &head;
>  
>      info->status = CalculatingState;
> @@ -112,7 +112,7 @@ static struct DirtyRateInfo *query_dirty_rate_info(void)
>              info->sample_pages = 0;
>              info->has_vcpu_dirty_rate = true;
>              for (i = 0; i < DirtyStat.dirty_ring.nvcpu; i++) {
> -                DirtyRateVcpu *rate = g_malloc0(sizeof(DirtyRateVcpu));
> +                DirtyRateVcpu *rate = g_new0(DirtyRateVcpu, 1);
>                  rate->id = DirtyStat.dirty_ring.rates[i].id;
>                  rate->dirty_rate = DirtyStat.dirty_ring.rates[i].dirty_rate;
>                  QAPI_LIST_APPEND(tail, rate);
> diff --git a/migration/multifd-zlib.c b/migration/multifd-zlib.c
> index aba1c88a0c..3a7ae44485 100644
> --- a/migration/multifd-zlib.c
> +++ b/migration/multifd-zlib.c
> @@ -43,7 +43,7 @@ struct zlib_data {
>   */
>  static int zlib_send_setup(MultiFDSendParams *p, Error **errp)
>  {
> -    struct zlib_data *z = g_malloc0(sizeof(struct zlib_data));
> +    struct zlib_data *z = g_new0(struct zlib_data, 1);
>      z_stream *zs = &z->zs;
>  
>      zs->zalloc = Z_NULL;
> @@ -164,7 +164,7 @@ static int zlib_send_prepare(MultiFDSendParams *p, Error **errp)
>   */
>  static int zlib_recv_setup(MultiFDRecvParams *p, Error **errp)
>  {
> -    struct zlib_data *z = g_malloc0(sizeof(struct zlib_data));
> +    struct zlib_data *z = g_new0(struct zlib_data, 1);
>      z_stream *zs = &z->zs;
>  
>      p->data = z;
> diff --git a/migration/ram.c b/migration/ram.c
> index 170e522a1f..3532f64ecb 100644
> --- a/migration/ram.c
> +++ b/migration/ram.c
> @@ -2059,7 +2059,7 @@ int ram_save_queue_pages(const char *rbname, ram_addr_t start, ram_addr_t len)
>      }
>  
>      struct RAMSrcPageRequest *new_entry =
> -        g_malloc0(sizeof(struct RAMSrcPageRequest));
> +        g_new0(struct RAMSrcPageRequest, 1);
>      new_entry->rb = ramblock;
>      new_entry->offset = start;
>      new_entry->len = len;

For migration:
Acked-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


