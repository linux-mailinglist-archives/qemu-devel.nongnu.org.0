Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52BF44E5239
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Mar 2022 13:34:48 +0100 (CET)
Received: from localhost ([::1]:42176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nX0CN-00041c-5y
	for lists+qemu-devel@lfdr.de; Wed, 23 Mar 2022 08:34:47 -0400
Received: from eggs.gnu.org ([209.51.188.92]:53356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <v.sementsov-og@mail.ru>)
 id 1nX06d-00010G-MG
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 08:28:54 -0400
Received: from smtp3.mail.ru ([94.100.179.58]:32996)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <v.sementsov-og@mail.ru>)
 id 1nX06a-0001at-Ub
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 08:28:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mail.ru;
 s=mail4; 
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=JPZ4tK/iOvqLL4YY9cHBCsDD0KkFaVaE8df/lt613is=; 
 t=1648038529;x=1648643929; 
 b=wy8goAQ6kxdxpMON2PWsa8KKLf/kqDplmTJ09tgMeVccqCMUoVkOGR33NWH3jZkYVtIToxUfQU0TfjJEvPEyL5edDCAejP5QS+BDUHeNnzIq1B+wcXizFzCk2+/ATVmgPWhsWSKnp1H5pADUdUy/nbhOBYYwvsoUbtj9xc27mxVUeNHdhzSifa0IAcD4PIp+8Qi7XpLBgq/3n/dcGyqsGsv69LFvF2pClWSX4WEhkkcOYZUvjGFnBbw+HOvWhjH5zMR3l7xMQKwaFVyUIeYxbh3XUpZdrjFglcclvbCh5SCV9LK58Q7IiMLwICADrc2mml1F+k56Vo0PIgsgeF4Tlg==;
Received: by smtp3.mail.ru with esmtpa (envelope-from <v.sementsov-og@mail.ru>)
 id 1nX06U-0008Ou-TL; Wed, 23 Mar 2022 15:28:43 +0300
Message-ID: <e04ccc1f-1111-e45a-e04b-2803208f234c@mail.ru>
Date: Wed, 23 Mar 2022 15:28:41 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v1 1/8] migration: Implemented new parameter stream_content
Content-Language: en-US
To: Nikita Lapshin <nikita.lapshin@openvz.org>, qemu-devel@nongnu.org
Cc: den@openvz.org, Nikita Lapshin <nikita.lapshin@virtuozzo.com>
References: <20220323105400.17649-1-nikita.lapshin@openvz.org>
 <20220323105400.17649-2-nikita.lapshin@openvz.org>
From: Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>
In-Reply-To: <20220323105400.17649-2-nikita.lapshin@openvz.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Authentication-Results: smtp3.mail.ru;
 auth=pass smtp.auth=v.sementsov-og@mail.ru
 smtp.mailfrom=v.sementsov-og@mail.ru
X-7564579A: EEAE043A70213CC8
X-77F55803: 4F1203BC0FB41BD95C8DF32398C35CA640B06EEE757A11FFF4F198476F253530182A05F5380850404C228DA9ACA6FE279BAB0D1A3CDE4292F50505060909E50928C57202FD6058A588ABD1F80E2440DE
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7CEF52BA550D6CAADEA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F79006376AFB9B40001E44068638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D8F5F11F06F6970FFCF33842F107D03D876F9789CCF6C18C3F8528715B7D10C86878DA827A17800CE7655D724DF6BFD6619FA2833FD35BB23D9E625A9149C048EE33AC447995A7AD18CB629EEF1311BF91D2E47CDBA5A96583BD4B6F7A4D31EC0BC014FD901B82EE079FA2833FD35BB23D27C277FBC8AE2E8B60CDF180582EB8FBA471835C12D1D977C4224003CC836476EB9C4185024447017B076A6E789B0E975F5C1EE8F4F765FC040E0003A52AFEF73AA81AA40904B5D9CF19DD082D7633A078D18283394535A93AA81AA40904B5D98AA50765F79006376A45045F672EF67AD81D268191BDAD3D698AB9A7B718F8C4D1B931868CE1C5781A620F70A64A45A98AA50765F79006372E808ACE2090B5E1725E5C173C3A84C3C5EA940A35A165FF2DBA43225CD8A89FA999322EAAB3F9C2262FEC7FBD7D1F5BB5C8C57E37DE458BEDA766A37F9254B7
X-8FC586DF: 6EFBBC1D9D64D975
X-C1DE0DAB: 0D63561A33F958A58B3B219CDF963B1702E44E0C6F1D4BF32D67CC7AAA6A2F73D59269BC5F550898D99A6476B3ADF6B47008B74DF8BB9EF7333BD3B22AA88B938A852937E12ACA754E2A133C74F7AB4F410CA545F18667F91A7EA1CDA0B5A7A0
X-C8649E89: 4E36BF7865823D7055A7F0CF078B5EC49A30900B95165D34A5BF8FA0BD61F994A649EB1EE028B01681438C6D769088415357A2C652D9EC628505F65C0BBAFF401D7E09C32AA3244C3109AB24225367ED2297945D07C7091C24AF4FAF06DA24FD927AC6DF5659F194
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojVRXGxxa4QmBvFMkleMqS5A==
X-Mailru-Sender: 6C3E74F07C41AE94BE5520CD20DE4F15F324C095F012C90FD46131A32830F7CC54034546C7239A1AE6462B2528CDCABCE234FDC7CE4030BEBA6D275AA6409EB3BDC3C9FB484E02823A35ECB215E68A28E3F6503ABEB32C155FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
Received-SPF: pass client-ip=94.100.179.58;
 envelope-from=v.sementsov-og@mail.ru; helo=smtp3.mail.ru
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

23.03.2022 13:53, Nikita Lapshin wrote:
> From: Nikita Lapshin <nikita.lapshin@virtuozzo.com>

You'd better change author of commit, to keep signed-off-by email and author email to be the same thing.

> 
> This new optional parameter contains inormation about migration
> stream parts to be sent (such as RAM, block, bitmap). This looks
> better than using capabilities to solve problem of dividing
> migration stream.
> 
> Signed-off-by: Nikita Lapshin <nikita.lapshin@openvz.org>
> ---
>   migration/migration.c | 47 ++++++++++++++++++++++++++++++++++++++++++-
>   migration/migration.h |  2 ++
>   qapi/migration.json   | 21 ++++++++++++++++---
>   3 files changed, 66 insertions(+), 4 deletions(-)
> 
> diff --git a/migration/migration.c b/migration/migration.c
> index 695f0f2900..4adcc87d1d 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -1334,6 +1334,12 @@ void qmp_migrate_set_capabilities(MigrationCapabilityStatusList *params,
>       }
>   }
>   
> +static bool check_stream_parts(strList *stream_content_list)
> +{
> +    /* To be implemented in ext commits */
> +    return true;
> +}
> +
>   /*
>    * Check whether the parameters are valid. Error will be put into errp
>    * (if provided). Return true if valid, otherwise false.
> @@ -1482,7 +1488,12 @@ static bool migrate_params_check(MigrationParameters *params, Error **errp)
>           return false;
>       }
>   
> -    return true;
> +    if (params->has_stream_content_list &&
> +        !check_stream_parts(params->stream_content_list)) {
> +        error_setg(errp, "Invalid parts of stream given for stream-content");
> +    }
> +
> +   return true;
>   }
>   
>   static void migrate_params_test_apply(MigrateSetParameters *params,
> @@ -1581,6 +1592,11 @@ static void migrate_params_test_apply(MigrateSetParameters *params,
>           dest->has_block_bitmap_mapping = true;
>           dest->block_bitmap_mapping = params->block_bitmap_mapping;
>       }
> +
> +    if (params->has_stream_content_list) {
> +        dest->has_stream_content_list = true;
> +        dest->stream_content_list = params->stream_content_list;
> +    }
>   }
>   
>   static void migrate_params_apply(MigrateSetParameters *params, Error **errp)
> @@ -1703,6 +1719,13 @@ static void migrate_params_apply(MigrateSetParameters *params, Error **errp)
>               QAPI_CLONE(BitmapMigrationNodeAliasList,
>                          params->block_bitmap_mapping);
>       }
> +
> +    if (params->has_stream_content_list) {
> +        qapi_free_strList(s->parameters.stream_content_list);
> +        s->parameters.has_stream_content_list = true;
> +        s->parameters.stream_content_list =
> +            QAPI_CLONE(strList, params->stream_content_list);
> +    }
>   }
>   
>   void qmp_migrate_set_parameters(MigrateSetParameters *params, Error **errp)
> @@ -2620,6 +2643,28 @@ bool migrate_background_snapshot(void)
>       return s->enabled_capabilities[MIGRATION_CAPABILITY_BACKGROUND_SNAPSHOT];
>   }
>   
> +/* Checks if stream-content parameter has section_name in list */
> +bool migrate_find_stream_content(const char *section_name)
> +{
> +    MigrationState *s;
> +
> +    s = migrate_get_current();
> +
> +    if (!s->parameters.has_stream_content_list) {
> +        return false;
> +    }
> +
> +    strList *list = s->parameters.stream_content_list;
> +
> +    for (; list; list = list->next) {
> +        if (!strcmp(list->value, section_name)) {
> +            return true;
> +        }
> +    }
> +
> +    return false;
> +}
> +
>   /* migration thread support */
>   /*
>    * Something bad happened to the RP stream, mark an error
> diff --git a/migration/migration.h b/migration/migration.h
> index 2de861df01..411c58e919 100644
> --- a/migration/migration.h
> +++ b/migration/migration.h
> @@ -396,6 +396,8 @@ bool migrate_use_events(void);
>   bool migrate_postcopy_blocktime(void);
>   bool migrate_background_snapshot(void);
>   
> +bool migrate_find_stream_content(const char *section_name);
> +
>   /* Sending on the return path - generic and then for each message type */
>   void migrate_send_rp_shut(MigrationIncomingState *mis,
>                             uint32_t value);
> diff --git a/qapi/migration.json b/qapi/migration.json
> index 18e2610e88..80acf6dbc3 100644
> --- a/qapi/migration.json
> +++ b/qapi/migration.json
> @@ -760,6 +760,12 @@
>   #                        block device name if there is one, and to their node name
>   #                        otherwise. (Since 5.2)
>   #
> +# @stream-content-list: Parameter control content of migration stream such as RAM,
> +#                       vmstate, block and dirty-bitmaps. This is optional parameter
> +#                       so migration will work correctly without it.
> +#                       This parameter takes string list as description of content
> +#                       and include that part of migration stream. (Since 7.0)

Should be 7.1.

I also think that simpler "stream-content" name would be enough

> +#
>   # Features:
>   # @unstable: Member @x-checkpoint-delay is experimental.
>   #
> @@ -780,7 +786,8 @@
>              'xbzrle-cache-size', 'max-postcopy-bandwidth',
>              'max-cpu-throttle', 'multifd-compression',
>              'multifd-zlib-level' ,'multifd-zstd-level',
> -           'block-bitmap-mapping' ] }
> +           'block-bitmap-mapping',
> +           'stream-content-list' ] }
>   
>   ##
>   # @MigrateSetParameters:
> @@ -925,6 +932,12 @@
>   #                        block device name if there is one, and to their node name
>   #                        otherwise. (Since 5.2)
>   #
> +# @stream-content-list: Parameter control content of migration stream such as RAM,
> +#                       vmstate, block and dirty-bitmaps. This is optional parameter
> +#                       so migration will work correctly without it.
> +#                       This parameter takes string list as description of content
> +#                       and include that part of migration stream. (Since 7.0)
> +#
>   # Features:
>   # @unstable: Member @x-checkpoint-delay is experimental.
>   #
> @@ -960,7 +973,8 @@
>               '*multifd-compression': 'MultiFDCompression',
>               '*multifd-zlib-level': 'uint8',
>               '*multifd-zstd-level': 'uint8',
> -            '*block-bitmap-mapping': [ 'BitmapMigrationNodeAlias' ] } }
> +            '*block-bitmap-mapping': [ 'BitmapMigrationNodeAlias' ],
> +            '*stream-content-list': [ 'str' ] } }

Don't make it a list of strings. Better define enum, like

{ 'enum': 'StreamContentType',
   'data': [ 'block-dirty-bitmaps', 'ram', .. ] }

And make stream-content to be list of this new enum type

>   
>   ##
>   # @migrate-set-parameters:
> @@ -1158,7 +1172,8 @@
>               '*multifd-compression': 'MultiFDCompression',
>               '*multifd-zlib-level': 'uint8',
>               '*multifd-zstd-level': 'uint8',
> -            '*block-bitmap-mapping': [ 'BitmapMigrationNodeAlias' ] } }
> +            '*block-bitmap-mapping': [ 'BitmapMigrationNodeAlias' ],
> +            '*stream-content-list': [ 'str' ] } }
>   
>   ##
>   # @query-migrate-parameters:


That's not a real problem, but IMHO it's better to add QAPI interface together with the feature itself (although some functions may be implemented in earlier patches). Otherwise, starting from this commit we do have a new documented QAPI interface, but it actually doesn't work until some future commit.


-- 
Best regards,
Vladimir

