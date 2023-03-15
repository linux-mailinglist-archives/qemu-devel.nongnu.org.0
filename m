Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 795BF6BBDB6
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Mar 2023 20:59:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pcXGJ-00084o-Ef; Wed, 15 Mar 2023 15:58:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1pcXGH-00084Q-0k
 for qemu-devel@nongnu.org; Wed, 15 Mar 2023 15:58:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1pcXGE-0008KJ-PX
 for qemu-devel@nongnu.org; Wed, 15 Mar 2023 15:58:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678910288;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PxIVutOZj4hNop6aDNWUppfx1en9A1wqCiApb2BvyUQ=;
 b=Oewe0cLJ8GIkfX4N+WYYd/+uNKWeZSdc02jpnxtuj2DnCz9H+v8kdx860KqzEmnyuBu+Us
 ROnvUrUELFwke9OGUl4J6GYFOIeDXHRFawq8aqdmNPSbu8Md7BfDArpHqDvU50+HS0bZNz
 zKfXTdWHfcGRctyFBkfc2y7MJAz0mKY=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-64-9n7OOPKVMZODVS5JM-lB4w-1; Wed, 15 Mar 2023 15:58:06 -0400
X-MC-Unique: 9n7OOPKVMZODVS5JM-lB4w-1
Received: by mail-wr1-f72.google.com with SMTP id
 7-20020a5d47a7000000b002be0eb97f4fso3467230wrb.8
 for <qemu-devel@nongnu.org>; Wed, 15 Mar 2023 12:58:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678910285;
 h=user-agent:in-reply-to:content-transfer-encoding
 :content-disposition:mime-version:references:message-id:subject:cc
 :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PxIVutOZj4hNop6aDNWUppfx1en9A1wqCiApb2BvyUQ=;
 b=rxlrROdYqXwNIXvI9qKpZsyHhGxYYSVn8lsLRLs5Ks/A9GGprb3NFgSC1ddnpjLNLl
 4ggYClWDuQwcmYxzXK2aeQFP2FZ31aovgto1pcSie2QUeq8JtBGes4wFJxnu2mSq3BOc
 BZotFiuSaoNE0oyIPwIJo4z87NwiT6i5Vs0lI3fypb/+plbNKCT+ThkBHYTptVOeGzC3
 VtMb6BhQyAMsSrAOL8jEcbe7+9nvsJaKW1HQtZ9dtFAho/si0l0a3/6vjeT9rMR6AGff
 CijWYR95gUGr3p1FO0BrsTgFSd7GkIgMoIm/ZXzt11SS0HKItexXn1/iUE2H771Pn98h
 po3w==
X-Gm-Message-State: AO0yUKX6+gEXT9iWxgHfLuCcD8Eap6q5ipPJUpBepZzuEXvRqG8+eKem
 TfqY+wXU2vArNSddWuH4J5F0MAUUzhFbM3LaH5evW+WE68SmWo+nQFNEZ3ltTIY+Zgi71sxbtwY
 7QwldIT/7bjsmZ6U=
X-Received: by 2002:adf:cc84:0:b0:2c5:483f:1580 with SMTP id
 p4-20020adfcc84000000b002c5483f1580mr3277140wrj.12.1678910285265; 
 Wed, 15 Mar 2023 12:58:05 -0700 (PDT)
X-Google-Smtp-Source: AK7set81t+iQJIbKDZ6WIop3TqUhHOKcKW2nLquK823lRpaH+NIptCJyePEwwVOVV14zbLc8nysXnQ==
X-Received: by 2002:adf:cc84:0:b0:2c5:483f:1580 with SMTP id
 p4-20020adfcc84000000b002c5483f1580mr3277124wrj.12.1678910284905; 
 Wed, 15 Mar 2023 12:58:04 -0700 (PDT)
Received: from work-vm
 (ward-16-b2-v4wan-166627-cust863.vm18.cable.virginm.net. [81.97.203.96])
 by smtp.gmail.com with ESMTPSA id
 n7-20020a5d4847000000b002c5d3f0f737sm5432183wrs.30.2023.03.15.12.58.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Mar 2023 12:58:04 -0700 (PDT)
Date: Wed, 15 Mar 2023 19:58:01 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Michael Roth <michael.roth@amd.com>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v3 3/3] qapi: Generate enum count as definition
Message-ID: <ZBIjSUjMT0KnFPlx@work-vm>
References: <20230315112811.22355-1-philmd@linaro.org>
 <20230315112811.22355-4-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230315112811.22355-4-philmd@linaro.org>
User-Agent: Mutt/2.2.9 (2022-11-12)
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
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

* Philippe Mathieu-Daudé (philmd@linaro.org) wrote:
> QAPI's gen_enum() generates QAPI enum values and the
> number of this values (as foo__MAX).
> The number of entries in an enum type is not part of
> the enumerated values, but we generate it as such.
> See for example:
> 
>   typedef enum OnOffAuto {
>       ON_OFF_AUTO_AUTO,
>       ON_OFF_AUTO_ON,
>       ON_OFF_AUTO_OFF,
>       ON_OFF_AUTO__MAX,        <---------
>   } OnOffAuto;
> 
> Instead of declaring the enum count as the last enumerated
> value, #define it, so it is not part of the enum.
> The previous example becomes:
> 
>   typedef enum OnOffAuto {
>       ON_OFF_AUTO_AUTO,
>       ON_OFF_AUTO_ON,
>       ON_OFF_AUTO_OFF,
>   #define ON_OFF_AUTO__MAX 3   <---------
>   } OnOffAuto;
> 
> When iterating over a QAPISchemaEnumType, all possible
> values are covered. The 'default' switch case generated in
> gen_visit_object_members() is now unreachable, remove it.
> 
> Since Clang enables the -Wswitch warning by default [*],
> remove all pointless foo__MAX cases in switch statement,
> in order to avoid:
> 
>  audio/audio.c:2231:10: error: case value not in enumerated type 'AudioFormat' (aka 'enum AudioFormat') [-Wswitch]
>     case AUDIO_FORMAT__MAX:
>          ^
>  ui/input.c:233:14: error: case value not in enumerated type 'KeyValueKind' (aka 'enum KeyValueKind') [-Wswitch]
>         case KEY_VALUE_KIND__MAX:
>              ^
>  ...
> 
> [*] https://clang.llvm.org/docs/DiagnosticsReference.html#wswitch
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Reviewed-by: Juan Quintela <quintela@redhat.com>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>  docs/devel/qapi-code-gen.rst |  4 ++--
>  scripts/qapi/types.py        | 11 +++++++----
>  scripts/qapi/visit.py        |  2 --
>  audio/audio_template.h       |  3 ---
>  audio/audio.c                |  6 ------
>  migration/migration.c        |  2 --
>  replay/replay-input.c        | 12 ------------
>  softmmu/tpm-hmp-cmds.c       |  2 --
>  ui/input-linux.c             |  4 ----
>  ui/input.c                   |  6 ------
>  10 files changed, 9 insertions(+), 43 deletions(-)
> 
> diff --git a/docs/devel/qapi-code-gen.rst b/docs/devel/qapi-code-gen.rst
> index d684c7c24d..45b0da448d 100644
> --- a/docs/devel/qapi-code-gen.rst
> +++ b/docs/devel/qapi-code-gen.rst
> @@ -227,7 +227,7 @@ optional 'prefix' member overrides PREFIX.
>  
>  The generated C enumeration constants have values 0, 1, ..., N-1 (in
>  QAPI schema order), where N is the number of values.  There is an
> -additional enumeration constant PREFIX__MAX with value N.
> +additional definition constant PREFIX__MAX with value N.
>  
>  Do not use string or an integer type when an enumeration type can do
>  the job satisfactorily.
> @@ -1825,7 +1825,7 @@ Example::
>  
>      typedef enum example_QAPIEvent {
>          EXAMPLE_QAPI_EVENT_MY_EVENT,
> -        EXAMPLE_QAPI_EVENT__MAX,
> +    #define EXAMPLE_QAPI_EVENT__MAX 1
>      } example_QAPIEvent;
>  
>      #define example_QAPIEvent_str(val) \
> diff --git a/scripts/qapi/types.py b/scripts/qapi/types.py
> index 7a7be7315f..6459a6f925 100644
> --- a/scripts/qapi/types.py
> +++ b/scripts/qapi/types.py
> @@ -88,16 +88,13 @@ def gen_enum(name: str,
>               members: List[QAPISchemaEnumMember],
>               prefix: Optional[str] = None) -> str:
>      assert members
> -    # append automatically generated _MAX value
> -    enum_members = members + [QAPISchemaEnumMember('_MAX', None)]
> -
>      ret = mcgen('''
>  
>  typedef enum %(c_name)s {
>  ''',
>                  c_name=c_name(name))
>  
> -    for memb in enum_members:
> +    for memb in members:
>          ret += memb.ifcond.gen_if()
>          ret += mcgen('''
>      %(c_enum)s,
> @@ -105,6 +102,12 @@ def gen_enum(name: str,
>                       c_enum=c_enum_const(name, memb.name, prefix))
>          ret += memb.ifcond.gen_endif()
>  
> +    ret += mcgen('''
> +#define %(c_name)s %(c_length)s
> +''',
> +                 c_name=c_enum_const(name, '_MAX', prefix),
> +                 c_length=len(members))
> +
>      ret += mcgen('''
>  } %(c_name)s;
>  ''',
> diff --git a/scripts/qapi/visit.py b/scripts/qapi/visit.py
> index 26a584ee4c..f66a31a963 100644
> --- a/scripts/qapi/visit.py
> +++ b/scripts/qapi/visit.py
> @@ -159,8 +159,6 @@ def gen_visit_object_members(name: str,
>  
>              ret += var.ifcond.gen_endif()
>          ret += mcgen('''
> -    default:
> -        abort();
>      }
>  ''')
>  
> diff --git a/audio/audio_template.h b/audio/audio_template.h
> index e42326c20d..d545c03afb 100644
> --- a/audio/audio_template.h
> +++ b/audio/audio_template.h
> @@ -376,9 +376,6 @@ AudiodevPerDirectionOptions *glue(audio_get_pdo_, TYPE)(Audiodev *dev)
>  #endif
>      case AUDIODEV_DRIVER_WAV:
>          return dev->u.wav.TYPE;
> -
> -    case AUDIODEV_DRIVER__MAX:
> -        break;
>      }
>      abort();
>  }
> diff --git a/audio/audio.c b/audio/audio.c
> index 70b096713c..ea372288eb 100644
> --- a/audio/audio.c
> +++ b/audio/audio.c
> @@ -2071,9 +2071,6 @@ void audio_create_pdos(Audiodev *dev)
>          CASE(SPICE, spice, );
>  #endif
>          CASE(WAV, wav, );
> -
> -    case AUDIODEV_DRIVER__MAX:
> -        abort();
>      };
>  }
>  
> @@ -2219,9 +2216,6 @@ int audioformat_bytes_per_sample(AudioFormat fmt)
>      case AUDIO_FORMAT_S32:
>      case AUDIO_FORMAT_F32:
>          return 4;
> -
> -    case AUDIO_FORMAT__MAX:
> -        ;
>      }
>      abort();
>  }
> diff --git a/migration/migration.c b/migration/migration.c
> index ae2025d9d8..bdadab3b5e 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -2220,8 +2220,6 @@ bool migration_is_idle(void)
>      case MIGRATION_STATUS_DEVICE:
>      case MIGRATION_STATUS_WAIT_UNPLUG:
>          return false;
> -    case MIGRATION_STATUS__MAX:
> -        g_assert_not_reached();

Acked-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

>      }
>  
>      return false;
> diff --git a/replay/replay-input.c b/replay/replay-input.c
> index 1147e3d34e..c6de8e33ac 100644
> --- a/replay/replay-input.c
> +++ b/replay/replay-input.c
> @@ -38,9 +38,6 @@ void replay_save_input_event(InputEvent *evt)
>              replay_put_dword(key->key->u.qcode.data);
>              replay_put_byte(key->down);
>              break;
> -        case KEY_VALUE_KIND__MAX:
> -            /* keep gcc happy */
> -            break;
>          }
>          break;
>      case INPUT_EVENT_KIND_BTN:
> @@ -58,9 +55,6 @@ void replay_save_input_event(InputEvent *evt)
>          replay_put_dword(move->axis);
>          replay_put_qword(move->value);
>          break;
> -    case INPUT_EVENT_KIND__MAX:
> -        /* keep gcc happy */
> -        break;
>      }
>  }
>  
> @@ -89,9 +83,6 @@ InputEvent *replay_read_input_event(void)
>              evt.u.key.data->key->u.qcode.data = (QKeyCode)replay_get_dword();
>              evt.u.key.data->down = replay_get_byte();
>              break;
> -        case KEY_VALUE_KIND__MAX:
> -            /* keep gcc happy */
> -            break;
>          }
>          break;
>      case INPUT_EVENT_KIND_BTN:
> @@ -109,9 +100,6 @@ InputEvent *replay_read_input_event(void)
>          evt.u.abs.data->axis = (InputAxis)replay_get_dword();
>          evt.u.abs.data->value = replay_get_qword();
>          break;
> -    case INPUT_EVENT_KIND__MAX:
> -        /* keep gcc happy */
> -        break;
>      }
>  
>      return QAPI_CLONE(InputEvent, &evt);
> diff --git a/softmmu/tpm-hmp-cmds.c b/softmmu/tpm-hmp-cmds.c
> index 9ed6ad6c4d..5a354cf6ac 100644
> --- a/softmmu/tpm-hmp-cmds.c
> +++ b/softmmu/tpm-hmp-cmds.c
> @@ -52,8 +52,6 @@ void hmp_info_tpm(Monitor *mon, const QDict *qdict)
>              teo = ti->options->u.emulator.data;
>              monitor_printf(mon, ",chardev=%s", teo->chardev);
>              break;
> -        case TPM_TYPE__MAX:
> -            break;
>          }
>          monitor_printf(mon, "\n");
>          c++;
> diff --git a/ui/input-linux.c b/ui/input-linux.c
> index e572a2e905..a6e7574422 100644
> --- a/ui/input-linux.c
> +++ b/ui/input-linux.c
> @@ -120,10 +120,6 @@ static bool input_linux_check_toggle(InputLinux *il)
>          return (il->keydown[KEY_LEFTCTRL] ||
>                  il->keydown[KEY_RIGHTCTRL]) &&
>              il->keydown[KEY_SCROLLLOCK];
> -
> -    case GRAB_TOGGLE_KEYS__MAX:
> -        /* avoid gcc error */
> -        break;
>      }
>      return false;
>  }
> diff --git a/ui/input.c b/ui/input.c
> index f2d1e7a3a7..ca8f49a403 100644
> --- a/ui/input.c
> +++ b/ui/input.c
> @@ -230,9 +230,6 @@ static void qemu_input_event_trace(QemuConsole *src, InputEvent *evt)
>              name = QKeyCode_str(key->key->u.qcode.data);
>              trace_input_event_key_qcode(idx, name, key->down);
>              break;
> -        case KEY_VALUE_KIND__MAX:
> -            /* keep gcc happy */
> -            break;
>          }
>          break;
>      case INPUT_EVENT_KIND_BTN:
> @@ -250,9 +247,6 @@ static void qemu_input_event_trace(QemuConsole *src, InputEvent *evt)
>          name = InputAxis_str(move->axis);
>          trace_input_event_abs(idx, name, move->value);
>          break;
> -    case INPUT_EVENT_KIND__MAX:
> -        /* keep gcc happy */
> -        break;
>      }
>  }
>  
> -- 
> 2.38.1
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


