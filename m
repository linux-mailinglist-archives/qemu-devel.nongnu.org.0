Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A5283FCE95
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Aug 2021 22:31:18 +0200 (CEST)
Received: from localhost ([::1]:58816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLAPd-0003H5-A6
	for lists+qemu-devel@lfdr.de; Tue, 31 Aug 2021 16:31:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mLAN6-0001lo-GR
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 16:28:40 -0400
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632]:38440)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mLAN4-0008H9-Lc
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 16:28:40 -0400
Received: by mail-ej1-x632.google.com with SMTP id n27so1618113eja.5
 for <qemu-devel@nongnu.org>; Tue, 31 Aug 2021 13:28:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ghFEX3xMK8UPb0mZNm7DLWFKUWu0WYDHovIjkpzAaXc=;
 b=E69tadqiS/NHIMhTkh693qiNmUoPbnAiv8Fzw/+YysmsL8rQ61O7uu9JeGQd8RvZ0h
 +3Y/Nvu+ldu4E+bPh3g4wIBTsYU/WjNvLthcmPphxknKBIgFjD8q3zBG0Eh4KYAvXD+s
 iD94Jw0Edd9cbgT2chW6m3S4wxCissmyENRF1WxOMAN1bVn3KM6wpADtupIKxwk6/6q3
 daPuO3yv8taWtxKEOET2JLZ1+wmH0aQ8DNvISCuVZbVB6paoxOjcuTiODtA5ABvhax/x
 Mw0BAI9XeFrD1ju405UxC3nm/SO2CmYjgsnTJCxGqz+cXLTNR5osOry+ZQHd97uOPXcg
 zU7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ghFEX3xMK8UPb0mZNm7DLWFKUWu0WYDHovIjkpzAaXc=;
 b=qq35RgyPRgY5UBD7kpmKGqcuOL+ye4RXfkNEP7UEmtljxLhpp1cHKdJNijYJsM1Z2p
 4c/rpKFc/hZIvFxXLeylTZ4SJlbVQjn/ETb+zAEacJKCfFOqhnMkwvcE0KzfRnKZrN/e
 HKh/neriF2A+sUcG1ykUlNb8fn6/xQVnBZev83iTm28hU35dzdy162TDJ1f7eAIiFAny
 0DXgEGd23l8kkmnIo7KS3EVNzTocYq+cpWHN0ydoHIQzaM9iVXz+UCp/x+r2sHgl8nUP
 /kmff2AdzUazVNZUW4ouGejGXzlhP9Cn9yLlvOCljTwVEFf2LDv4+QrAUB956OR93cv4
 lmvg==
X-Gm-Message-State: AOAM531liaAV7Jbnq3q2dSlzkMu1iTj/hLA3U/a75lCb+ZZVQ5RqE13s
 B0f4PFZBvDSC/NNZbOTB8hVMiaNXNXyeeUIqBs8cqQ==
X-Google-Smtp-Source: ABdhPJxKjO7bTfhGwHIBEfJ5tjLS8O6xeahNWmtC5+5jGC/ScKqQT5NeMXQWPdOAWDVkjGoNj07KC74iJ4MoZOyMzEY=
X-Received: by 2002:a17:906:a108:: with SMTP id
 t8mr33030518ejy.407.1630441717035; 
 Tue, 31 Aug 2021 13:28:37 -0700 (PDT)
MIME-Version: 1.0
References: <20210823085429.597873-1-philmd@redhat.com>
In-Reply-To: <20210823085429.597873-1-philmd@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 31 Aug 2021 21:27:48 +0100
Message-ID: <CAFEAcA_tPGNWYmXDAnUqmBY1fzwQQ+ccCZ_icF67eoKE-eTPXA@mail.gmail.com>
Subject: Re: [PATCH v3] memory: Have 'info mtree' remove duplicated Address
 Space information
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x632.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: David Hildenbrand <david@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 QEMU Developers <qemu-devel@nongnu.org>, Peter Xu <peterx@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 23 Aug 2021 at 09:54, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.co=
m> wrote:
>
> Per Peter Maydell [*]:
>
>   'info mtree' monitor command was designed on the assumption that
>   there's really only one or two interesting address spaces, and
>   with more recent developments that's just not the case any more.
>
> Similarly about how the FlatView are sorted using a GHashTable,
> sort the AddressSpace objects to remove the duplications (AS
> using the same root MemoryRegion).
>


> diff --git a/softmmu/memory.c b/softmmu/memory.c
> index bfedaf9c4df..459d6246672 100644
> --- a/softmmu/memory.c
> +++ b/softmmu/memory.c
> @@ -3246,11 +3246,55 @@ static gboolean mtree_info_flatview_free(gpointer=
 key, gpointer value,
>      return true;
>  }
>
> +struct AddressSpaceInfo {
> +    MemoryRegionListHead *ml_head;
> +    bool owner;
> +    bool disabled;
> +};
> +
> +/* Returns negative value if a < b; zero if a =3D b; positive value if a=
 > b. */
> +static gint address_space_compare_name(gconstpointer a, gconstpointer b)
> +{
> +    const AddressSpace *as_a =3D a;
> +    const AddressSpace *as_b =3D b;
> +
> +    return g_strcmp0(as_a->name, as_b->name);
> +}
> +static void mtree_print_as_name(gpointer data, gpointer user_data)
> +{
> +    AddressSpace *as =3D data;
> +
> +    qemu_printf("address-space: %s\n", as->name);
> +}
> +
> +static void mtree_print_as(gpointer key, gpointer value, gpointer user_d=
ata)
> +{
> +    MemoryRegion *mr =3D key;
> +    GSList *as_same_root_mr_list =3D value;
> +    struct AddressSpaceInfo *asi =3D user_data;
> +
> +    g_slist_foreach(as_same_root_mr_list, mtree_print_as_name, NULL);
> +    mtree_print_mr(mr, 1, 0, asi->ml_head, asi->owner, asi->disabled);
> +    qemu_printf("\n");
> +}
> +
> +static gboolean mtree_info_as_free(gpointer key, gpointer value,
> +                                   gpointer user_data)
> +{
> +    GSList *as_same_root_mr_list =3D value;
> +
> +    g_slist_free(as_same_root_mr_list);
> +
> +    return true;
> +}
> +
>  void mtree_info(bool flatview, bool dispatch_tree, bool owner, bool disa=
bled)
>  {
>      MemoryRegionListHead ml_head;
>      MemoryRegionList *ml, *ml2;
>      AddressSpace *as;
> +    GHashTable *views =3D g_hash_table_new(g_direct_hash, g_direct_equal=
);
> +    GSList *as_same_root_mr_list;
>
>      if (flatview) {
>          FlatView *view;
> @@ -3260,7 +3304,6 @@ void mtree_info(bool flatview, bool dispatch_tree, =
bool owner, bool disabled)
>              .owner =3D owner,
>          };
>          GArray *fv_address_spaces;
> -        GHashTable *views =3D g_hash_table_new(g_direct_hash, g_direct_e=
qual);
>          AccelClass *ac =3D ACCEL_GET_CLASS(current_accel());
>
>          if (ac->has_memory) {
> @@ -3293,11 +3336,24 @@ void mtree_info(bool flatview, bool dispatch_tree=
, bool owner, bool disabled)
>      QTAILQ_INIT(&ml_head);
>
>      QTAILQ_FOREACH(as, &address_spaces, address_spaces_link) {
> -        qemu_printf("address-space: %s\n", as->name);
> -        mtree_print_mr(as->root, 1, 0, &ml_head, owner, disabled);
> -        qemu_printf("\n");
> +        /* Create hashtable, key=3DAS root MR, value =3D list of AS */
> +        as_same_root_mr_list =3D g_hash_table_lookup(views, as->root);
> +        as_same_root_mr_list =3D g_slist_insert_sorted(as_same_root_mr_l=
ist, as,
> +                                                     address_space_compa=
re_name);
> +        g_hash_table_insert(views, as->root, as_same_root_mr_list);
>      }
>
> +    struct AddressSpaceInfo asi =3D {
> +        .ml_head =3D &ml_head,
> +        .owner =3D owner,
> +        .disabled =3D disabled,
> +    };

Strictly speaking this is against our coding-style "no variable
declarations in the middle of a block".

> +
> +    /* print address spaces */
> +    g_hash_table_foreach(views, mtree_print_as, &asi);
> +    g_hash_table_foreach_remove(views, mtree_info_as_free, 0);
> +    g_hash_table_unref(views);
> +
>      /* print aliased regions */
>      QTAILQ_FOREACH(ml, &ml_head, mrqueue) {
>          qemu_printf("memory-region: %s\n", memory_region_name(ml->mr));
> --
> 2.31.1

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

Side note: I wonder if it would be worth splitting mtree_info()
into a function for ASes and a function for flatviews? The two
cases share basically no code, and there's only one callsite.

thanks
-- PMM

