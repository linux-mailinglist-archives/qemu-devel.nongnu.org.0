Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 597CF6BAEF8
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Mar 2023 12:14:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pcP4d-0006wZ-7J; Wed, 15 Mar 2023 07:13:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pcP4V-0006w4-Mw
 for qemu-devel@nongnu.org; Wed, 15 Mar 2023 07:13:31 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pcP4T-0005sT-8O
 for qemu-devel@nongnu.org; Wed, 15 Mar 2023 07:13:31 -0400
Received: by mail-wr1-x429.google.com with SMTP id v16so16990692wrn.0
 for <qemu-devel@nongnu.org>; Wed, 15 Mar 2023 04:13:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678878803;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=//5seo2TSzF/3VLgMfgiFJLBcnXxkX/wX9Zucyusedg=;
 b=kiLbaHoxR7xXH1UD+jjOx1WuHeSNe8kI31RUqeatmQ1tTy3PZdtPcC8U+vPLTq4Hcf
 E5iVBqDn0HkPkcMok/WOb+2LQwXM7RlN1wniFerIJbdHNyPz1l+rPB2WOBgKBwKTtSmY
 AmIhop/nNLpsELNG9tZi5vVfVhU1OmX7eU5Xk+IeL8Qy4dLDtIRgJB6z3Nyko8NPmfgW
 anxQz49zGsUA9nllgbUQmKXWRbfgRiaeNTLZk8XEmr/6ugxk/Ikx3gmcwSyhhp+W5bFI
 ZA/nko1/8rnEWuJ8pRSvA5O8GMPOecKbYyxRnDH4NlMlDaybAVhx7Partw+Ybl524PMt
 uxYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678878803;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=//5seo2TSzF/3VLgMfgiFJLBcnXxkX/wX9Zucyusedg=;
 b=MN3SzKfN0huF31i6ZWCPkHfiOcKSz+aDYMJNdLzwOGte5Eg5zTrS07mbQJd3ZyhAr1
 VcQnN56Otr3xa9iyStrr+p3oGZD2IG6MYkCNidH54sj24/sI6gIDDmRHfGMCjUwN+Twy
 JonEXRz0wtTgHYjbxmSgMGuMSCXY78q03g4vNlt4Fq/9WOBxyjpVPUgXO4DmU1RNgoIk
 OrMbmKRWz7wRrQs2v/jKYOBFmNMGhXJ8QqhK2G1lT9KF2w9H8bCxmAoHu5D3RR+vZsme
 5DsYqylTAIcQXj1IzlVHI+vCS+jmk6kCv1AYQhDG+6ic3YubnhHZqXb6+10mcp2mHJa3
 BMRQ==
X-Gm-Message-State: AO0yUKVwzzJ6NRgGj/XjAFx//pEUwkHUh7T2mrejGt2Kqn1tnuy4K98i
 7Bm1wBg3M8GONYFr5a8HX4WNv0JVfUoydP25hrYajw==
X-Google-Smtp-Source: AK7set85seUJEitps4r/aninGUX05+/9qj8rRh1mbH07TcHFtqP+ptM5InmL4YSESc6lZmo4c6ynNw==
X-Received: by 2002:a5d:5259:0:b0:2cf:eed0:f6fb with SMTP id
 k25-20020a5d5259000000b002cfeed0f6fbmr1767101wrc.32.1678878802976; 
 Wed, 15 Mar 2023 04:13:22 -0700 (PDT)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 f3-20020a0560001b0300b002c559626a50sm4417937wrz.13.2023.03.15.04.13.21
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 15 Mar 2023 04:13:22 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Michael Roth <michael.roth@amd.com>, Markus Armbruster <armbru@redhat.com>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v2 3/3] qapi: Generate enum count as definition
Date: Wed, 15 Mar 2023 12:13:04 +0100
Message-Id: <20230315111304.21692-4-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230315111304.21692-1-philmd@linaro.org>
References: <20230315111304.21692-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

QAPI's gen_enum() generates QAPI enum values and the
number of this values (as foo__MAX).
The number of entries in an enum type is not part of
the enumerated values, but we generate it as such.
See for example:

  typedef enum OnOffAuto {
      ON_OFF_AUTO_AUTO,
      ON_OFF_AUTO_ON,
      ON_OFF_AUTO_OFF,
      ON_OFF_AUTO__MAX,        <---------
  } OnOffAuto;

Instead of declaring the enum count as the last enumerated
value, #define it, so it is not part of the enum.
The previous example becomes:

  typedef enum OnOffAuto {
      ON_OFF_AUTO_AUTO,
      ON_OFF_AUTO_ON,
      ON_OFF_AUTO_OFF,
  #define ON_OFF_AUTO__MAX 3   <---------
  } OnOffAuto;

When iterating over a QAPISchemaEnumType, all possible
values are covered. The 'default' switch case generated in
gen_visit_object_members() is now unreachable, remove it.

Since Clang enables the -Wswitch warning by default [*],
remove all pointless foo__MAX cases in switch statement,
in order to avoid:

 audio/audio.c:2231:10: error: case value not in enumerated type 'AudioFormat' (aka 'enum AudioFormat') [-Wswitch]
    case AUDIO_FORMAT__MAX:
         ^
 ui/input.c:233:14: error: case value not in enumerated type 'KeyValueKind' (aka 'enum KeyValueKind') [-Wswitch]
        case KEY_VALUE_KIND__MAX:
             ^
 ...

[*] https://clang.llvm.org/docs/DiagnosticsReference.html#wswitch
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 docs/devel/qapi-code-gen.rst |  4 ++--
 scripts/qapi/types.py        | 11 +++++++----
 scripts/qapi/visit.py        |  2 --
 audio/audio_template.h       |  3 ---
 audio/audio.c                |  6 ------
 migration/migration.c        |  2 --
 replay/replay-input.c        | 12 ------------
 softmmu/tpm-hmp-cmds.c       |  2 --
 ui/input-linux.c             |  4 ----
 ui/input.c                   |  6 ------
 10 files changed, 9 insertions(+), 43 deletions(-)

diff --git a/docs/devel/qapi-code-gen.rst b/docs/devel/qapi-code-gen.rst
index d684c7c24d..45b0da448d 100644
--- a/docs/devel/qapi-code-gen.rst
+++ b/docs/devel/qapi-code-gen.rst
@@ -227,7 +227,7 @@ optional 'prefix' member overrides PREFIX.
 
 The generated C enumeration constants have values 0, 1, ..., N-1 (in
 QAPI schema order), where N is the number of values.  There is an
-additional enumeration constant PREFIX__MAX with value N.
+additional definition constant PREFIX__MAX with value N.
 
 Do not use string or an integer type when an enumeration type can do
 the job satisfactorily.
@@ -1825,7 +1825,7 @@ Example::
 
     typedef enum example_QAPIEvent {
         EXAMPLE_QAPI_EVENT_MY_EVENT,
-        EXAMPLE_QAPI_EVENT__MAX,
+    #define EXAMPLE_QAPI_EVENT__MAX 1
     } example_QAPIEvent;
 
     #define example_QAPIEvent_str(val) \
diff --git a/scripts/qapi/types.py b/scripts/qapi/types.py
index c39d054d2c..b24bcb40ad 100644
--- a/scripts/qapi/types.py
+++ b/scripts/qapi/types.py
@@ -86,16 +86,13 @@ def gen_enum_lookup(name: str,
 def gen_enum(name: str,
              members: List[QAPISchemaEnumMember],
              prefix: Optional[str] = None) -> str:
-    # append automatically generated _MAX value
-    enum_members = members + [QAPISchemaEnumMember('_MAX', None)]
-
     ret = mcgen('''
 
 typedef enum %(c_name)s {
 ''',
                 c_name=c_name(name))
 
-    for memb in enum_members:
+    for memb in members:
         ret += memb.ifcond.gen_if()
         ret += mcgen('''
     %(c_enum)s,
@@ -103,6 +100,12 @@ def gen_enum(name: str,
                      c_enum=c_enum_const(name, memb.name, prefix))
         ret += memb.ifcond.gen_endif()
 
+    ret += mcgen('''
+#define %(c_name)s %(c_length)s
+''',
+                 c_name=c_enum_const(name, '_MAX', prefix),
+                 c_length=len(members))
+
     ret += mcgen('''
 } %(c_name)s;
 ''',
diff --git a/scripts/qapi/visit.py b/scripts/qapi/visit.py
index 26a584ee4c..f66a31a963 100644
--- a/scripts/qapi/visit.py
+++ b/scripts/qapi/visit.py
@@ -159,8 +159,6 @@ def gen_visit_object_members(name: str,
 
             ret += var.ifcond.gen_endif()
         ret += mcgen('''
-    default:
-        abort();
     }
 ''')
 
diff --git a/audio/audio_template.h b/audio/audio_template.h
index e42326c20d..d545c03afb 100644
--- a/audio/audio_template.h
+++ b/audio/audio_template.h
@@ -376,9 +376,6 @@ AudiodevPerDirectionOptions *glue(audio_get_pdo_, TYPE)(Audiodev *dev)
 #endif
     case AUDIODEV_DRIVER_WAV:
         return dev->u.wav.TYPE;
-
-    case AUDIODEV_DRIVER__MAX:
-        break;
     }
     abort();
 }
diff --git a/audio/audio.c b/audio/audio.c
index 70b096713c..ea372288eb 100644
--- a/audio/audio.c
+++ b/audio/audio.c
@@ -2071,9 +2071,6 @@ void audio_create_pdos(Audiodev *dev)
         CASE(SPICE, spice, );
 #endif
         CASE(WAV, wav, );
-
-    case AUDIODEV_DRIVER__MAX:
-        abort();
     };
 }
 
@@ -2219,9 +2216,6 @@ int audioformat_bytes_per_sample(AudioFormat fmt)
     case AUDIO_FORMAT_S32:
     case AUDIO_FORMAT_F32:
         return 4;
-
-    case AUDIO_FORMAT__MAX:
-        ;
     }
     abort();
 }
diff --git a/migration/migration.c b/migration/migration.c
index ae2025d9d8..bdadab3b5e 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -2220,8 +2220,6 @@ bool migration_is_idle(void)
     case MIGRATION_STATUS_DEVICE:
     case MIGRATION_STATUS_WAIT_UNPLUG:
         return false;
-    case MIGRATION_STATUS__MAX:
-        g_assert_not_reached();
     }
 
     return false;
diff --git a/replay/replay-input.c b/replay/replay-input.c
index 1147e3d34e..c6de8e33ac 100644
--- a/replay/replay-input.c
+++ b/replay/replay-input.c
@@ -38,9 +38,6 @@ void replay_save_input_event(InputEvent *evt)
             replay_put_dword(key->key->u.qcode.data);
             replay_put_byte(key->down);
             break;
-        case KEY_VALUE_KIND__MAX:
-            /* keep gcc happy */
-            break;
         }
         break;
     case INPUT_EVENT_KIND_BTN:
@@ -58,9 +55,6 @@ void replay_save_input_event(InputEvent *evt)
         replay_put_dword(move->axis);
         replay_put_qword(move->value);
         break;
-    case INPUT_EVENT_KIND__MAX:
-        /* keep gcc happy */
-        break;
     }
 }
 
@@ -89,9 +83,6 @@ InputEvent *replay_read_input_event(void)
             evt.u.key.data->key->u.qcode.data = (QKeyCode)replay_get_dword();
             evt.u.key.data->down = replay_get_byte();
             break;
-        case KEY_VALUE_KIND__MAX:
-            /* keep gcc happy */
-            break;
         }
         break;
     case INPUT_EVENT_KIND_BTN:
@@ -109,9 +100,6 @@ InputEvent *replay_read_input_event(void)
         evt.u.abs.data->axis = (InputAxis)replay_get_dword();
         evt.u.abs.data->value = replay_get_qword();
         break;
-    case INPUT_EVENT_KIND__MAX:
-        /* keep gcc happy */
-        break;
     }
 
     return QAPI_CLONE(InputEvent, &evt);
diff --git a/softmmu/tpm-hmp-cmds.c b/softmmu/tpm-hmp-cmds.c
index 9ed6ad6c4d..5a354cf6ac 100644
--- a/softmmu/tpm-hmp-cmds.c
+++ b/softmmu/tpm-hmp-cmds.c
@@ -52,8 +52,6 @@ void hmp_info_tpm(Monitor *mon, const QDict *qdict)
             teo = ti->options->u.emulator.data;
             monitor_printf(mon, ",chardev=%s", teo->chardev);
             break;
-        case TPM_TYPE__MAX:
-            break;
         }
         monitor_printf(mon, "\n");
         c++;
diff --git a/ui/input-linux.c b/ui/input-linux.c
index e572a2e905..a6e7574422 100644
--- a/ui/input-linux.c
+++ b/ui/input-linux.c
@@ -120,10 +120,6 @@ static bool input_linux_check_toggle(InputLinux *il)
         return (il->keydown[KEY_LEFTCTRL] ||
                 il->keydown[KEY_RIGHTCTRL]) &&
             il->keydown[KEY_SCROLLLOCK];
-
-    case GRAB_TOGGLE_KEYS__MAX:
-        /* avoid gcc error */
-        break;
     }
     return false;
 }
diff --git a/ui/input.c b/ui/input.c
index f2d1e7a3a7..ca8f49a403 100644
--- a/ui/input.c
+++ b/ui/input.c
@@ -230,9 +230,6 @@ static void qemu_input_event_trace(QemuConsole *src, InputEvent *evt)
             name = QKeyCode_str(key->key->u.qcode.data);
             trace_input_event_key_qcode(idx, name, key->down);
             break;
-        case KEY_VALUE_KIND__MAX:
-            /* keep gcc happy */
-            break;
         }
         break;
     case INPUT_EVENT_KIND_BTN:
@@ -250,9 +247,6 @@ static void qemu_input_event_trace(QemuConsole *src, InputEvent *evt)
         name = InputAxis_str(move->axis);
         trace_input_event_abs(idx, name, move->value);
         break;
-    case INPUT_EVENT_KIND__MAX:
-        /* keep gcc happy */
-        break;
     }
 }
 
-- 
2.38.1


